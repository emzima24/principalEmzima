package org.example;

import io.appium.java_client.android.connection.ConnectionState;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.ScreenOrientation;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;


import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;

public class InteraccionTest {
    @Test
    public void obtenerOrientacion() throws MalformedURLException, URISyntaxException {
        AndroidDriver driver = crearConexion();
        // Obtener orientacion e imprimir por consola
        ScreenOrientation orientacionActual = driver.getOrientation();
        System.out.println("La orientacion actual del dispositivo es:" + orientacionActual);
        // Cerrar la sesión de driver
        driver.quit();
    }
    @Test
    public void verificarConexionDatosMoviles() throws MalformedURLException, URISyntaxException {
        AndroidDriver driver = crearConexion();
        ConnectionState conexiónActual = driver.getConnection();
        boolean isDataEnabled = conexiónActual.isDataEnabled();
        System.out.println("Conexión a datos móviles activada: " + isDataEnabled);
        driver.quit();
    }
    @Test
    public void obtenerNombreDispositivo() throws MalformedURLException, URISyntaxException {
        AndroidDriver driver = crearConexion();
        Capabilities capabilities = driver.getCapabilities();
        String nombreDispositivo = (String)
                capabilities.getCapability("deviceName");
        System.out.println("El nombre del dispositivo conectado es: " +
                nombreDispositivo);
        driver.quit();
    }
    @Test
    public void obtenerVersionAndroid() throws MalformedURLException, URISyntaxException {
        AndroidDriver driver = crearConexion();
        Capabilities capabilities = driver.getCapabilities();
        String versionDispositivo = (String)
                capabilities.getCapability("platformVersion");
        System.out.println("La versión de Android del dispositivo conectado es: "
                + versionDispositivo);
        driver.quit();
    }
    public AndroidDriver crearConexion() throws URISyntaxException, MalformedURLException {
        UiAutomator2Options options = new UiAutomator2Options();
        options.setDeviceName("R58W2054VLH"); // Nombre del dispositivo
        options.setPlatformName("Android");
        // Añadir configuración para aumentar timeout
        options.setCapability("uiautomator2ServerInstallTimeout", 60000);
        options.setCapability("adbExecTimeout", 60000);

        // Retornar el driver con las opciones configuradas
        return new AndroidDriver(new URI("http://127.0.0.1:4723").toURL(), options);
    }
}
