package org.example;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.empty;
import static org.junit.jupiter.api.Assertions.assertTrue;

import static java.util.concurrent.TimeUnit.SECONDS;
import static org.awaitility.Awaitility.await;

public class CheckAndCleanEndpointTest {
    private static final String BASE_URL = "https://67e3fa702ae442db76d26b68.mockapi.io/banksimulation/v1";
    private static final String ENDPOINT = "/users";

    @BeforeAll
    public static void setup() {
        RestAssured.baseURI = BASE_URL;
    }

    @Test
    public void verifyAndCleanEndpoint() {
        // Given - Obtener todos los usuarios
        List<Map<String, Object>> users = given().get(ENDPOINT).then().extract().jsonPath().getList("$");

        // When - Eliminar todos si existen
        if (users != null && !users.isEmpty()) {
            System.out.println("Encontrados " + users.size() + " elementos para eliminar");
            users.stream()
                    .map(user -> user.get("usersId"))
                    .filter(Objects::nonNull)
                    .forEach(id -> given().delete(ENDPOINT + "/" + id).then().statusCode(200));
        }

        // Then - Verificar que quedó vacío (con reintentos)
        await().atMost(3, SECONDS).untilAsserted(() ->
                given()
                        .get(ENDPOINT)
                        .then()
                        .statusCode(200)
                        .body("$", empty())
        );
        System.out.println("Verificación final: El endpoint está vacío");
    }
}
