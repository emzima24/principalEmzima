package org.example;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;

import java.time.Duration;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
/*Esta anotación la utilizo para establecer"orden" de ejeución en los test*/
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class PruebaDosAplicaciones {
    // Declaración de variables a utilizar
    private AndroidDriver driver;
    // Info primera aplicacion elegida dispositivo físico
    private String firstAppPackage = "com.instagram.android";
    //private String firstAppActivity = "com.instagram.android/com.instagram.mainactivity.InstagramMainActivity";
// Info segunda aplicacion elegida dispositivo físico
    private String secondAppPackage = "com.csdroid.pkg";
    // private String secondAppActivity = "com.csdroid.pkg/com.csdroid.pkg.MainActivity"
// "com.sec.android.app.popupcalculator.Calculator";
// Antes de ejecutar cualquier Test, me ocupo de inicializar el Driver
    @BeforeEach
    public void setUp() throws MalformedURLException {
// Inicializar el driver con las configuraciones de la primera aplicación
        driver = inicializarDriver("R58W2054VLH", "Android");
        esperar(10); // Esperar 10 segundos antes de comenzar
    }
    @AfterEach
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
    @Test
    @Order(1)
    public void gestionarDosAplicaciones() throws MalformedURLException {
// Gestion con la primera aplicación (instagram)
        abrirAplicacion(firstAppPackage);
        ponerAplicacionEnSegundoPlano();
        cerrarAplicacion(firstAppPackage);
// Gestion con la segunda aplicación (package)
        abrirAplicacion(secondAppPackage);
        ponerAplicacionEnSegundoPlano();
        cerrarAplicacion(secondAppPackage);
    }
    private void abrirAplicacion(String appPackage) {
        validarDriverInicializado();
        driver.activateApp(appPackage);
        esperar(10);
    }
    private void ponerAplicacionEnSegundoPlano() {
        validarDriverInicializado();
        esperar(10);// Esperar 10 segundos antes de poner en segundo plano
        driver.runAppInBackground(Duration.ofSeconds(10));// 10 segundos en segundo plano
    }
    private void cerrarAplicacion(String appPackage) {
        validarDriverInicializado();
        driver.terminateApp(appPackage);
    }
    private AndroidDriver inicializarDriver(String udid, String
            platformName) throws MalformedURLException {
// Configura las opciones para el driver de Appium
        UiAutomator2Options options = new UiAutomator2Options();
        options.setUdid(udid); // Especificar el UDID del dispositivo
        options.setDeviceName("MiGalaxy"); // Nombre del dispositivo
        options.setPlatformName(platformName); // Plataforma (Android)
        options.setNoReset(true); // No restablecer los datos de la app
// Inicializar el driver con la URL del servidor Appium
        URL appiumServerURL = URI.create("http://127.0.0.1:4723").toURL();
        return new AndroidDriver(appiumServerURL, options);
    }
    // Método para pausar la ejecución del código por la cantidad de segundos
// indicada
    private void esperar(int segundos) {
        try {
            Thread.sleep(segundos * 1000); // Convertir segundos a milisegundos
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    private void validarDriverInicializado() {
        if (driver == null) {
            throw new IllegalStateException("El driver no está inicializado.");
        }
    }
}
