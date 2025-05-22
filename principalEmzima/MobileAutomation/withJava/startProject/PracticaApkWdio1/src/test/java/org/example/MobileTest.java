package org.example;

import org.junit.jupiter.api.Order;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import org.testng.asserts.SoftAssert;

import java.time.Duration;
public class MobileTest extends BaseTest {


    @BeforeMethod
    public void setUp() throws Exception {
        System.out.println("[DEBUG] Configurando sesión para Mobile Mygalaxy");
        setupDriver("MyGalaxy", "R58W2054VLH");
    }

    @Test
    @Order(1)
    public void testLoginOnMobileMygalaxy() {
        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

            System.out.println("[DEBUG] Paso 1: Haciendo clic en icono de login");
            wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//android.widget.TextView[@text=\"\uDB80\uDF42\"]"))
            ).click();

            System.out.println("[DEBUG] Paso 2: Ingresando credenciales");
            wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//android.widget.EditText[@content-desc=\"input-email\"]"))
            ).sendKeys("testuser@correo.com");

            wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//android.widget.EditText[@content-desc=\"input-password\"]"))
            ).sendKeys("12345678");

            System.out.println("[DEBUG] Paso 3: Haciendo clic en botón LOGIN");
            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.TextView[@text=\"LOGIN\"]"))
            ).click();

            System.out.println("[DEBUG] Paso 4: Verificando mensaje de éxito");
            String message = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//android.widget.TextView[@resource-id=\"android:id/message\"]"))
            ).getText();

            takeScreenshot("testLoginOnPhysicalDevice", "success_message_mobile");
            Assert.assertEquals(message, "You are logged in!", "El mensaje de éxito no coincide");

            System.out.println("[DEBUG] Paso 5: Haciendo clic en OK");
            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.Button[@resource-id=\"android:id/button1\"]"))
            ).click();

            System.out.println("[DEBUG] Login exitoso en Mobile MyGalaxy");
        } catch (Exception e) {
            System.err.println("[ERROR] Fallo en testLogin: " + e.getMessage());
        }
    }

    @Test
    @Order(2)
    public void testFormsOnMobileMygalaxy() {
        SoftAssert softAssert = new SoftAssert();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

        try {
            System.out.println("[DEBUG] Paso 1: Haciendo clic en icono de forms");
            wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//android.widget.TextView[@text=\"\uDB80\uDFEB\"]"))
            ).click();

            System.out.println("[DEBUG] Paso 2: Ingresando texto en el campo input");
            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.EditText[@content-desc=\"text-input\"]"))
            ).sendKeys("Boludo que ladilla");

            System.out.println("[DEBUG] Paso 3: Verificando mensaje de ingresado");
            String inputText = wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.TextView[@content-desc=\"input-text-result\"]"))
            ).getText();

            takeScreenshot("testformOnPhysicalDevice", "message_mobile");
            softAssert.assertEquals(inputText, "Boludo que ladilla", "El texto ingresado no coincide");

            System.out.println("[DEBUG] Paso 4: Haciendo clic en el switch");
            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.Switch[@content-desc=\"switch\"]"))
            ).click();

            takeScreenshot("testformOnPhysicalDevice", "switch_change");

            System.out.println("[DEBUG] Paso 5: Haciendo clic en menu desplegable");
            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.TextView[@text=\"\uDB80\uDD40\"]"))
            ).click();

            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.CheckedTextView[@resource-id=\"android:id/text1\" and @text=\"Appium is awesome\"]"))
            ).click();

            System.out.println("[DEBUG] Paso 6: Verificando mensaje seleccionado");
            String dropdownText = wait.until(ExpectedConditions.visibilityOfElementLocated(
                    By.xpath("//android.widget.EditText[@resource-id=\"text_input\"]"))
            ).getText();

            takeScreenshot("testformOnPhysicalDevice", "selection_dropdown_mobile");
            softAssert.assertEquals(dropdownText, "Appium is awesome", "La selección del dropdown no coincide");

            System.out.println("[DEBUG] Paso 7: Volviendo al menu principal");
            wait.until(ExpectedConditions.elementToBeClickable(
                    By.xpath("//android.widget.TextView[@text=\"\uDB81\uDEA1\"]"))
            ).click();

            takeScreenshot("testLoginOnPhysicalDevice", "home_mobile");

            System.out.println("[DEBUG] Forms exitoso en Mobile MyGalaxy");
        } catch (Exception e) {
            System.err.println("[ERROR] Fallo en testForms: " + e.getMessage());
            softAssert.fail("Excepción durante la ejecución: " + e.getMessage());
        } finally {
            softAssert.assertAll();
        }
    }
}