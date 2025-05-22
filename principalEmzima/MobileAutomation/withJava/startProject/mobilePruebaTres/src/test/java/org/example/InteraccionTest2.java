package org.example;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;

import org.junit.jupiter.api.Test;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;

public class InteraccionTest2 {
    @Test
    public void gestionarUbicacion() {
        AndroidDriver driver = null;

        try {
            driver = crearConexion();
// Activar ubicación
            driver.toggleLocationServices();
            System.out.println("Ubicación activada.");
// Desactivar ubicación
            driver.toggleLocationServices();
            System.out.println("Ubicación desactivada.");
        } catch (Exception e) {
            System.out.println("Error durante la gestión de ubicación: " +

                    e.getMessage());
        } finally {
            if (driver != null) {
                driver.quit();
                System.out.println("Sesión finalizada correctamente.");
            }
        }
    }
    @Test
    public void abrirNotificaciones() {
        AndroidDriver driver = null;
        try {
            driver = crearConexion();
// Abre el panel de notificaciones
            driver.openNotifications();
            System.out.println("Panel de notificaciones abierto.");
        } catch (Exception e) {
            System.out.println("Error al abrir las notificaciones: " +
                    e.getMessage());
        } finally {
            if (driver != null) {
                driver.quit();
                System.out.println(" Sesión finalizada correctamente.");
            }
        }}
    // Método independiente para crear la conexión
    public AndroidDriver crearConexion() throws MalformedURLException, URISyntaxException {
        UiAutomator2Options options = new UiAutomator2Options();
        options.setDeviceName("R58W2054VLH"); // Nombre del dispositivo
        options.setPlatformName("Android");
// Retornar el driver con las opciones configuradas
        return new AndroidDriver(new URI("http://127.0.0.1:4723").toURL(),
                options);
    }
}
