package common;

import io.qameta.allure.Allure;
import io.qameta.allure.Param;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

import java.io.ByteArrayInputStream;

public class ScreenshotUtil {

    public static void captureAndAttachScreenshot(WebDriver driver, String fileName) {
        try {
            byte[] screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);

            // Adjunta la captura al reporte de Allure
            Allure.addAttachment(fileName, new ByteArrayInputStream(screenshot));
        } catch (Exception e) {
            System.err.println("Error al capturar y adjuntar la imagen al reporte: " + e.getMessage());
        }

    }

}
