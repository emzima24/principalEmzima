package org.example;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.AfterMethod;

import java.io.File;
import java.net.URL;
import java.time.Duration;

public class BaseTest {
    protected AndroidDriver driver;

    // Método para configurar el driver según el dispositivo
    protected void setupDriver(String deviceName, String udid) throws Exception {
        UiAutomator2Options options = new UiAutomator2Options()
                .setPlatformName("Android")
                .setDeviceName(deviceName)
                .setUdid(udid)
                .setAutomationName("UiAutomator2")
                .setAppPackage("com.google.android.calculator")
                .setAppActivity("com.android.calculator2.Calculator")
                .setUiautomator2ServerLaunchTimeout(Duration.ofSeconds(30))
                .setAdbExecTimeout(Duration.ofSeconds(30));

        driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), options);
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
    }

    protected void takeScreenshot(String testName, String stepName) {
        try {
            // Crear directorio si no existe
            File directory = new File("imagen");
            if (!directory.exists()) {
                directory.mkdir();
            }

            // Tomar captura y guardar
            File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
            String fileName = String.format("imagen/%s_%s_%d.png",
                    testName, stepName, System.currentTimeMillis());
            FileUtils.copyFile(screenshot, new File(fileName));
            System.out.println("[SCREENSHOT] Captura guardada en: " + fileName);
        } catch (Exception e) {
            System.err.println("[ERROR] No se pudo tomar la captura: " + e.getMessage());
        }
    }
    @AfterMethod
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}

// para ejecutar un test especifico  en el emulador mvn test -Dtest=SelectDeviceCalculatorAppTest#testLanguageChangeToSpanish -Ddevice=emulator
// para ejecutar todos los test de esa clase  en el emulador mvn test -Dtest=SelectDeviceCalculatorAppTest -Ddevice=emulator
// para ejecutar todos los test de esa clase  en el mobile mvn test -Dtest=SelectDeviceCalculatorAppTest