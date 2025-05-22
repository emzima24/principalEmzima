package org.example;

import org.junit.jupiter.api.Test;


import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;


import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;


class ApplicationTest {
    @Test
    public void appium() throws URISyntaxException, MalformedURLException {
        UiAutomator2Options options = new UiAutomator2Options();
        options.setDeviceName("R58W2054VLH"); // Nombre del dispositivo
        options.setPlatformName("Android");
        options.setAppPackage("com.google.android.youtube");
        options.setAppActivity("com.google.android.apps.youtube.app.WatchWhileActivity");

        // Añadir configuración para aumentar timeout
        options.setCapability("uiautomator2ServerInstallTimeout", 60000);
        options.setCapability("adbExecTimeout", 60000);

        AndroidDriver driver = new AndroidDriver(new URI("http://127.0.0.1:4723").toURL(), options);


    }


}