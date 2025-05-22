package org.example;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.net.MalformedURLException;
import java.net.URI;
import java.time.Duration;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.ScreenOrientation;
import io.appium.java_client.AppiumBy;

public class ComplementarioPruebaTres {

    private AndroidDriver driver;
    private static final String DEVICE_UDID = "R58W2054VLH"; // Tu UDID de dispositivo

    @BeforeEach
    public void setUp() throws MalformedURLException, URISyntaxException {
        UiAutomator2Options options = new UiAutomator2Options();
        options.setUdid(DEVICE_UDID);
        options.setDeviceName("MiGalaxy");
        options.setPlatformName("Android");

        driver = new AndroidDriver(new URI("http://127.0.0.1:4723").toURL(), options);
        esperar(5);
    }

    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }

    @Test
    public void testFuncionesAvanzadas() throws IOException {
        // 1. Cambiar orientación de pantalla
        cambiarOrientacionPantalla();

        // 2. Realizar desplazamiento
        realizarScroll();

        // 3. Tomar captura de pantalla
        tomarCapturaPantalla("prueba_pupu.png");
    }

    private void cambiarOrientacionPantalla() {
        // Cambiar a landscape (horizontal)
        driver.rotate(ScreenOrientation.LANDSCAPE);
        System.out.println("Orientación cambiada a LANDSCAPE");
        esperar(2);

        // Volver a portrait (vertical)
        driver.rotate(ScreenOrientation.PORTRAIT);
        System.out.println("Orientación cambiada a PORTRAIT");
        esperar(2);
    }

    private void realizarScroll() {
        // Scroll hacia arriba (de abajo hacia arriba)
        driver.findElement(AppiumBy.androidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true))" +
                        ".scrollForward()"));

        System.out.println("Scroll realizado con éxito");
        esperar(2);
    }

    private void tomarCapturaPantalla(String nombreArchivo) throws IOException {
        File screenshot = driver.getScreenshotAs(OutputType.FILE);
        File destino = new File(System.getProperty("user.dir") + "/" + nombreArchivo);

        Files.copy(screenshot.toPath(), destino.toPath(), StandardCopyOption.REPLACE_EXISTING);
        System.out.println("Captura guardada en: " + destino.getAbsolutePath());
    }

    private void esperar(int segundos) {
        try {
            Thread.sleep(segundos * 1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}