package org.example;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.connection.ConnectionState;
import io.appium.java_client.android.options.UiAutomator2Options;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.ScreenOrientation;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class InteraccionTest {

    // Configuración de dispositivos
    private static final Map<String, Map<String, Object>> DEVICES = new HashMap<>();
    static {
        // Dispositivo físico
        Map<String, Object> dispositivoFisico = new HashMap<>();
        dispositivoFisico.put("deviceName", "MiGalaxy");
        dispositivoFisico.put("udid", "R58W2054VLH");
        dispositivoFisico.put("systemPort", 8200);
        dispositivoFisico.put("appiumPort", 4723); // Puerto Appium específico

        // Emulador
        Map<String, Object> emulador = new HashMap<>();
        emulador.put("deviceName", "Pixel_7");  // Nombre para mostrar
        emulador.put("udid", "emulator-5554");
        emulador.put("systemPort", 8201);
        emulador.put("appiumPort", 4724);
        emulador.put("avdName", "Pixel_7");  // Nombre real del AVD

        DEVICES.put("DispositivoFisico", dispositivoFisico);
        DEVICES.put("Emulador", emulador);
    }

    @Test
    public void pruebaDoble() throws InterruptedException {
        ExecutorService executor = Executors.newFixedThreadPool(DEVICES.size());

        for (Map.Entry<String, Map<String, Object>> entry : DEVICES.entrySet()) {
            String deviceKey = entry.getKey();
            Map<String, Object> deviceConfig = entry.getValue();

            executor.execute(() -> {
                try {
                    System.out.println("Iniciando pruebas en " + deviceKey);
                    AndroidDriver driver = crearConexion(deviceConfig);

                    // Ejecutar todas las pruebas en este dispositivo
                    ejecutarTodasLasPruebas(driver);

                    driver.quit();
                    System.out.println("Pruebas completadas en " + deviceKey);
                } catch (Exception e) {
                    System.err.println("Error en " + deviceKey + ": " + e.getMessage());
                    e.printStackTrace();
                }
            });
        }

        executor.shutdown();
        executor.awaitTermination(5, TimeUnit.MINUTES);
    }

    private void ejecutarTodasLasPruebas(AndroidDriver driver) {
        obtenerOrientacion(driver);
        verificarConexionDatosMoviles(driver);
        obtenerNombreDispositivo(driver);
        obtenerVersionAndroid(driver);
    }

    // Métodos modificados para recibir el driver como parámetro
    private void obtenerOrientacion(AndroidDriver driver) {
        ScreenOrientation orientacionActual = driver.getOrientation();
        System.out.println("[" + getDeviceName(driver) + "] Orientación actual: " + orientacionActual);
    }

    private void verificarConexionDatosMoviles(AndroidDriver driver) {
        ConnectionState conexiónActual = driver.getConnection();
        boolean isDataEnabled = conexiónActual.isDataEnabled();
        System.out.println("[" + getDeviceName(driver) + "] Datos móviles activados: " + isDataEnabled);
    }

    private void obtenerNombreDispositivo(AndroidDriver driver) {
        String nombreDispositivo = (String) driver.getCapabilities().getCapability("deviceName");
        System.out.println("[" + getDeviceName(driver) + "] Nombre del dispositivo: " + nombreDispositivo);
    }

    private void obtenerVersionAndroid(AndroidDriver driver) {
        String versionDispositivo = (String) driver.getCapabilities().getCapability("platformVersion");
        System.out.println("[" + getDeviceName(driver) + "] Versión Android: " + versionDispositivo);
    }

    private String getDeviceName(AndroidDriver driver) {
        return (String) driver.getCapabilities().getCapability("deviceName");
    }

    public AndroidDriver crearConexion(Map<String, Object> deviceConfig) throws URISyntaxException, MalformedURLException {
        UiAutomator2Options options = new UiAutomator2Options();
        options.setDeviceName((String) deviceConfig.get("deviceName"));
        options.setPlatformName("Android");
        options.setUdid((String) deviceConfig.get("udid"));

        // Configuraciones comunes
        options.setCapability("systemPort", deviceConfig.get("systemPort"));
        options.setCapability("uiautomator2ServerInstallTimeout", 90000);
        options.setCapability("adbExecTimeout", 90000);

        // Configuraciones específicas para emulador
        if (((String) deviceConfig.get("udid")).startsWith("emulator")) {
            options.setCapability("avd", "Pixel_7");
            options.setCapability("avdLaunchTimeout", 180000); // Aumentado a 3 minutos
            options.setCapability("avdReadyTimeout", 180000);
            options.setCapability("androidInstallTimeout", 180000);
            options.setCapability("enforceAppInstall", true);
            options.setCapability("uiautomator2ServerLaunchTimeout", 180000);
            options.setCapability("ignoreHiddenApiPolicyError", true);
        }

        // Configuraciones generales
        options.setCapability("skipDeviceInitialization", false); // Cambiado a false
        options.setCapability("skipServerInstallation", false); // Cambiado a false
        options.setCapability("noReset", false); // Cambiado a false

        return new AndroidDriver(new URI("http://127.0.0.1:4723").toURL(), options);
    }
}
