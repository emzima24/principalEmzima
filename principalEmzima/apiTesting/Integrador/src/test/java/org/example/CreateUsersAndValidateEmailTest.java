package org.example;

import com.github.javafaker.Faker;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import java.util.HashSet;
import java.util.Set;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

public class CreateUsersAndValidateEmailTest {

    private static final String BASE_URL = "https://67e3fa702ae442db76d26b68.mockapi.io/banksimulation/v1";
    private static final String ENDPOINT = "/users";

    @BeforeAll
    public static void setup() {
        RestAssured.baseURI = BASE_URL;
    }

    @Test
    public void crearUsuariosAleatoriosYValidarUnicidad() {
        Faker faker = new Faker();
        Set<Users> uniqueUsers = new HashSet<>();

        // Given: Generación de usuarios únicos
        while (uniqueUsers.size() < 10) {
            Users newUser = Users.generarUsuarioAleatorio(faker);
            uniqueUsers.add(newUser);
        }

        System.out.println("Usuarios generados:");
        uniqueUsers.forEach(System.out::println);

        // When/Then: Creación de usuarios y validación
        uniqueUsers.forEach(user -> {
            given()
                    .contentType(ContentType.JSON)
                    .body(user)
                    .when()
                    .post(ENDPOINT)
                    .then()
                    .statusCode(201)
                    .body("email", equalTo(user.getEmail()))
                    .log().ifValidationFails();

            System.out.println("Usuario creado exitosamente: " + user.getEmail());
        });
    }
}