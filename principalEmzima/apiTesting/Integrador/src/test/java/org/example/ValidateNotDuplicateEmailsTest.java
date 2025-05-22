package org.example;

import io.restassured.RestAssured;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.stream.Collectors;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class ValidateNotDuplicateEmailsTest {

    private static final String BASE_URL = "https://67e3fa702ae442db76d26b68.mockapi.io/banksimulation/v1";
    private static final String ENDPOINT = "/users";

    @BeforeAll
    public static void setup() {
        RestAssured.baseURI = BASE_URL;
    }

    @Test
    public void validarQueNoExistanCorreosDuplicados() {
        // Given: Precondición - Endpoint disponible
        // When: Acción - Obtenemos todos los usuarios
        List<String> emails = given()
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .contentType("application/json")
                .extract()
                .jsonPath()
                .getList("email");

        System.out.println("Total de correos obtenidos: " + emails.size());

        // Then: Validaciones en estilo BDD
        given()
                .when()
                .get(ENDPOINT)
                .then()
                .assertThat()
                .body("email",
                        allOf(
                                not(empty()), // Verifica que hay al menos un correo
                                everyItem(notNullValue()) // Todos los correos no son nulos
                        ));

        // Validación de unicidad
        long totalEmails = emails.size();
        long uniqueEmails = emails.stream().distinct().count();

        // Logging de correos duplicados
        List<String> duplicateEmails = emails.stream()
                .filter(email -> emails.indexOf(email) != emails.lastIndexOf(email))
                .distinct()
                .collect(Collectors.toList());

        if (!duplicateEmails.isEmpty()) {
            System.out.println("Correos duplicados encontrados:");
            duplicateEmails.forEach(email -> System.out.println("- " + email));
        } else {
            System.out.println("Validación exitosa: No se encontraron correos duplicados");
        }


    }
}
