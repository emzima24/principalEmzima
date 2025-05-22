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
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class ValidateMoneyDepositTest {
    private static final String BASE_URL = "https://67e3fa702ae442db76d26b68.mockapi.io/banksimulation/v1";
    private static final String ENDPOINT = "/users";
    private static final Random random = new Random();
    private static final Faker faker = new Faker();

    @BeforeAll
    public static void setup() {
        RestAssured.baseURI = BASE_URL;
    }

    @Test
    public void validarDepositoDineroConTransaccion() {
        // 1. Obtener un usuario aleatorio
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

        // Filtrar usuarios con cuenta válida (distinta de "-")
        List<Map<String, Object>> usuariosConCuentaValida = users.stream()
                .filter(user -> {
                    Object accountNumber = user.get("accountNumber");
                    return accountNumber != null && !accountNumber.toString().equals("-");
                })
                .collect(Collectors.toList());

        if (usuariosConCuentaValida.isEmpty()) {
            throw new RuntimeException("No hay usuarios con cuentas válidas (accountNumber != '-')");
        }

        // Seleccionar usuario aleatorio de la lista filtrada
        Map<String, Object> randomUser = usuariosConCuentaValida.get(random.nextInt(usuariosConCuentaValida.size()));
        String userId = randomUser.get("usersId").toString();
        String clientName = randomUser.get("name").toString();

        // 2. Obtener saldo actual (asumimos que el campo es "balance")
        double balance = Double.parseDouble(
                randomUser.getOrDefault("balance", "0").toString()
        );
        double amount = faker.number().randomDouble(2, 100, 10000); // Monto entre 10 y 1000

        System.out.println("Cliente: " + clientName +
                " | Saldo inicial: $" + balance +
                " | Depósito: $" + amount);

        // 3. Actualizar el saldo en el endpoint principal (/users)
        given()
                .contentType(ContentType.JSON)
                .body(Map.of("balance", balance + amount))
                .when()
                .patch(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .body("balance", equalTo((float) (balance + amount)));

        // 4. Registrar la transacción en /users/{usersId}/transactions
        String transactionDescription = faker.finance().creditCard(); // Descripción aleatoria
        String transactionEndpoint = ENDPOINT + "/" + userId + "/transactions";

        given()
                .contentType(ContentType.JSON)
                .body(Map.of(
                        "usersId", userId,
                        "type", "Deposit",
                        "description", "Depósito: " + transactionDescription,
                        "amount", amount
                ))
                .when()
                .post(transactionEndpoint)
                .then()
                .statusCode(201); // Código 201 (Created)

        // 5. Verificar el nuevo saldo y la transacción
        // 5.1. Saldo actualizado
        double saldoActualizado = given()
                .when()
                .get(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath()
                .getDouble("balance");

        double diferencia = Math.abs(saldoActualizado - (balance + amount));
        assert diferencia < 0.001 :
                String.format("Error en el saldo. Esperado: %.2f, Actual: %.2f",
                        (balance + amount), saldoActualizado);

        // 5.2. Transacción registrada
        List<Map<String, Object>> transactions = given()
                .when()
                .get(transactionEndpoint)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath()
                .getList("$");

        boolean transaccionEncontrada = transactions.stream()
                .anyMatch(t ->
                        t.get("type").equals("Deposit") &&
                                Double.parseDouble(t.get("amount").toString()) == amount
                );

        assert transaccionEncontrada : "La transacción no se registró correctamente";

        System.out.println("Depósito exitoso. Saldo actualizado: $" + saldoActualizado);
    }
}
