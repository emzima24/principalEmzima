package org.example;

import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.net.URL;
import java.time.Duration;
import java.util.List;

import static org.testng.Assert.*;

public class LocatorsTest {
    private AndroidDriver driver;
    private WebDriverWait wait;

    @BeforeClass
    public void setUp() throws Exception {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("platformName", "Android");
        caps.setCapability("appium:automationName", "UiAutomator2");
        caps.setCapability("appium:deviceName", "R58W2054VLH");
        caps.setCapability("appium:app", "/home/gerencia/Descargas/ApiDemos-debug.apk");
        caps.setCapability("appium:noReset", true);
        caps.setCapability("appium:appPackage", "io.appium.android.apis");
        caps.setCapability("appium:appActivity", "io.appium.android.apis.ApiDemos");
        caps.setCapability("appium:ensureWebviewsHavePages", true);
        caps.setCapability("appium:newCommandTimeout", 3600);

        URL url = new URL("http://127.0.0.1:4723");
        driver = new AndroidDriver(url, caps);
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
    }

    @Test(priority = 1)
    public void testAccessibilityFlow() {
        // Esperar y hacer clic en Accessibility
        WebElement accessibility = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.accessibilityId("Accessibility")));
        accessibility.click();

        // Esperar y hacer clic en Accessibility Node Querying
        WebElement nodeQuerying = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.accessibilityId("Accessibility Node Querying")));
        nodeQuerying.click();

        // Verificar el título
        WebElement title = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.id("io.appium.android.apis:id/title")));
        assertEquals(title.getText(), "Accessibility/Accessibility Node Querying");

        driver.navigate().back();
        driver.navigate().back();
    }

    @Test(priority = 2)
    public void testAnimationOptions() {
        // Esperar y hacer clic en Animation
        WebElement animation = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.accessibilityId("Animation")));
        animation.click();

        // Verificar Bouncing Balls
        WebElement bouncingBalls = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.xpath("//android.widget.TextView[@text='Bouncing Balls']")));
        assertEquals(bouncingBalls.getText(), "Bouncing Balls");

        // Verificar cantidad de opciones
        List<WebElement> options = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(
                By.className("android.widget.TextView")));
        assertTrue(options.size() >= 5);

        driver.navigate().back();
    }

    @Test(priority = 3)
    public void testTextEntry() {
        // Esperar y hacer clic en Text
        WebElement text = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.accessibilityId("Text")));
        text.click();

        // Esperar y hacer clic en LogTextBox
        WebElement logTextBox = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.accessibilityId("LogTextBox")));
        logTextBox.click();

        // Escribir texto
        WebElement textField = wait.until(ExpectedConditions.presenceOfElementLocated(
                By.id("io.appium.android.apis:id/text")));
        textField.sendKeys("Hola DeepSeek!");

        // Hacer clic en Add
        WebElement addButton = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.androidUIAutomator("new UiSelector().text(\"Add\")")));
        addButton.click();

        // Verificar texto agregado
        WebElement lastLog = wait.until(ExpectedConditions.presenceOfElementLocated(
                AppiumBy.androidUIAutomator("new UiSelector().className(\"android.widget.TextView\").instance(3)")));
        assertTrue(lastLog.getText().contains("Hola DeepSeek!"));

        driver.navigate().back();
        driver.navigate().back();
    }

    @AfterClass
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}