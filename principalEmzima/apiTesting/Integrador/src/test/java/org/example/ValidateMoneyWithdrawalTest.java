package org.example;

import com.github.javafaker.Faker;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class ValidateMoneyWithdrawalTest {
    private static final String BASE_URL = "https://67e3fa702ae442db76d26b68.mockapi.io/banksimulation/v1";
    private static final String ENDPOINT = "/users";
    private static final Random random = new Random();
    private static final Faker faker = new Faker();

    @BeforeAll
    public static void setup() {
        RestAssured.baseURI = BASE_URL;
    }

    @Test
    public void validarRetiroDineroConTransaccion() {
        // 1. Obtener un usuario aleatorio con cuenta válida
        JsonPath usersResponse = given()
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath();

        List<Map<String, Object>> users = usersResponse.getList("$");
        if (users == null || users.isEmpty()) {
            throw new RuntimeException("No se encontraron usuarios");
        }

        // Filtrar usuarios con cuenta válida
        List<Map<String, Object>> usuariosConCuentaValida = users.stream()
                .filter(user -> {
                    Object accountNumber = user.get("accountNumber");
                    return accountNumber != null && !accountNumber.toString().equals("-");
                })
                .collect(Collectors.toList());

        if (usuariosConCuentaValida.isEmpty()) {
            throw new RuntimeException("No hay usuarios con cuentas válidas (accountNumber != '-')");
        }

        Map<String, Object> randomUser = usuariosConCuentaValida.get(random.nextInt(usuariosConCuentaValida.size()));
        String userId = randomUser.get("usersId").toString();
        String clientName = randomUser.get("name").toString();
        double saldoInicial = Double.parseDouble(randomUser.getOrDefault("balance", "0").toString());

        // Caso 1: Retiro normal (monto menor al saldo)
        double montoRetiroNormal = Math.min(
                saldoInicial - 0.01,
                faker.number().randomDouble(2, 1, 1000)
        );
        testRetiroExitoso(userId, clientName, saldoInicial, montoRetiroNormal);

        // Actualizar saldoInicial después del primer retiro
        double saldoDespuesPrimerRetiro = saldoInicial - montoRetiroNormal;

        // Caso 2: Retiro de monto exacto (saldo queda en 0)
        testRetiroExitoso(userId, clientName, saldoDespuesPrimerRetiro, saldoDespuesPrimerRetiro);

        // Caso 3: Retiro mayor al saldo (debe fallar)
//        double montoRetiroExcesivo = faker.number().randomDouble(2, 1, 10000);
//        testRetiroFallido(userId, clientName, 0, montoRetiroExcesivo);
    }

    private void testRetiroExitoso(String userId, String clientName, double saldoInicial, double montoRetiro) {
        System.out.println("\n--- Probando retiro EXITOSO ---");
        System.out.println("Cliente: " + clientName +
                " | Saldo inicial: $" + String.format("%.2f", saldoInicial) +
                " | Retiro: $" + String.format("%.2f", montoRetiro));

        // Redondear valores para evitar problemas de precisión decimal
        double saldoEsperado = Math.round((saldoInicial - montoRetiro) * 100.0) / 100.0;

        // 1. Actualizar saldo (retiro)
        given()
                .contentType(ContentType.JSON)
                .body(Map.of("balance", saldoEsperado))
                .when()
                .patch(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .body("balance",
                        saldoEsperado == 0 ?
                        equalTo(0) :  // Para el caso de saldo exacto (cero)
                        equalTo((float) saldoEsperado)); // Para otros casos

        // 2. Registrar transacción
        String transactionEndpoint = ENDPOINT + "/" + userId + "/transactions";
        given()
                .contentType(ContentType.JSON)
                .body(Map.of(
                        "usersId", userId,
                        "type", "Withdrawal",
                        "description", "Retiro exitoso - Ref: " + faker.finance().creditCard(),
                        "amount", montoRetiro
                ))
                .when()
                .post(transactionEndpoint)
                .then()
                .statusCode(201);

        // 3. Verificar saldo actualizado
        double saldoActual = given()
                .when()
                .get(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath()
                .getDouble("balance");

        assertEquals(saldoEsperado, saldoActual, 0.001,
                "El saldo no disminuyó correctamente después del retiro");

        System.out.println("Retiro exitoso. Saldo actual: $" + String.format("%.2f", saldoActual));
    }

    private void testRetiroFallido(String userId, String clientName, double saldoActual, double montoRetiro) {
        System.out.println("\n--- Probando retiro FALLIDO (monto excesivo) ---");
        System.out.println("Cliente: " + clientName +
                " | Saldo actual: $" + String.format("%.2f", saldoActual) +
                " | Intento de retiro: $" + String.format("%.2f", montoRetiro));

        // 1. Guardar saldo inicial
        double saldoInicial = given()
                .when()
                .get(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath()
                .getDouble("balance");

        // 2. Intentar retiro (debe fallar)
        given()
                .contentType(ContentType.JSON)
                .body(Map.of("balance", saldoActual - montoRetiro))
                .when()
                .patch(ENDPOINT + "/" + userId)
                .then()
                .statusCode(400); // Código de error esperado

        // 3. Verificar que el saldo NO cambió
        double saldoPosterior = given()
                .when()
                .get(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath()
                .getDouble("balance");

        // Verificación más robusta con mensaje claro
        if (saldoInicial != saldoPosterior) {
            throw new AssertionError(String.format(
                    "El saldo cambió después de un retiro fallido. Inicial: %.2f, Posterior: %.2f",
                    saldoInicial, saldoPosterior
            ));
        }

        System.out.println("Retiro fallido (como se esperaba). Saldo actual: $" + String.format("%.2f", saldoPosterior));
    }
}
