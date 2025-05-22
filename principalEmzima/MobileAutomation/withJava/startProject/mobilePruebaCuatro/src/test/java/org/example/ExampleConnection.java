package org.example;

import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.android.AndroidDriver;
import java.net.URL;
import java.net.MalformedURLException;
import java.time.Duration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ExampleConnection {

    private AndroidDriver driver;

    @Before
    public void setUp() throws MalformedURLException {
        UiAutomator2Options options = new UiAutomator2Options()
                .setDeviceName("R58W2054VLH")
                .setApp("/home/gerencia/Descargas/ApiDemos-debug.apk")
                .setAppPackage("io.appium.android.apis")
                .setAppActivity("io.appium.android.apis.ApiDemos")
                .setAutomationName("UiAutomator2")
                .setNoReset(false)
                .setFullReset(false)
                .setEnsureWebviewsHavePages(true)
                .setNativeWebScreenshot(true)
                .setNewCommandTimeout(Duration.ofSeconds(3600));


        driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), options);
    }

    @Test
    public void sampleTest() {
        // Aquí puedes añadir tus pruebas
        // Ejemplo:
        // driver.findElement(AppiumBy.accessibilityId("Accessibility")).click();
    }

    @After
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
//{
//  "platformName": "Android",
//  "appium:deviceName": "R58W2054VLH",
//  "appium:appPackage": "io.appium.android.apis",
//  "appium:automationName": "UiAutomator2",
//  "appium:appActivity": "io.appium.android.apis.ApiDemos",
//  "appium:app": "/home/gerencia/Descargas/ApiDemos-debug.apk",
//  "appium:noReset": false,
//  "appium:fullReset": false
//}