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

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class UpdateAccountNumberTest {

    private static final String BASE_URL = "https://67e3fa702ae442db76d26b68.mockapi.io/banksimulation/v1";
    private static final String ENDPOINT = "/users";
    private static final Random random = new Random();
    private static final Faker faker = new Faker();

    @BeforeAll
    public static void setup() {
        RestAssured.baseURI = BASE_URL;
    }

    @Test
    public void actualizarCuentaYObtenerNombreCliente() {
        // 1. Obtener lista de usuarios con sus datos completos
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

        // 2. Seleccionar un usuario aleatorio
        Map<String, Object> randomUser = users.get(random.nextInt(users.size()));
        String userId = randomUser.get("usersId").toString();
        String clientName = randomUser.get("name").toString();
        String oldAccountNumber = randomUser.get("accountNumber") != null ?
                randomUser.get("accountNumber").toString() : "No tenía cuenta";

        assertNotNull(clientName, "El usuario seleccionado no tiene nombre");

        // 3. Generar nuevo número de cuenta
        String newAccountNumber = faker.number().digits(4) + "-" +
                faker.number().digits(4) + "-" +
                faker.number().digits(4);

        System.out.println("Actualizando cuenta para: " + clientName +
                " (ID: " + userId + ")");
        System.out.println("Cambiando cuenta de: " + oldAccountNumber +
                " a: " + newAccountNumber);

        // 4. Actualizar el número de cuenta
        given()
                .contentType(ContentType.JSON)
                .body(Map.of("accountNumber", newAccountNumber))
                .when()
                .patch(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .body("accountNumber", equalTo(newAccountNumber));

        // 5. Verificar la actualización y obtener datos actualizados
        Map<String, Object> updatedUser = given()
                .when()
                .get(ENDPOINT + "/" + userId)
                .then()
                .statusCode(200)
                .extract()
                .jsonPath()
                .getMap("$");

        System.out.println("Verificación exitosa para: " + updatedUser.get("name") +
                "\nNueva cuenta: " + updatedUser.get("accountNumber"));
    }
}