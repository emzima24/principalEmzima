package com.java.selenium;

import common.BrowserConfig;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.openqa.selenium.support.ui.WebDriverWait;
import utils.ValueReadingManager;

import java.time.Duration;

public class BeforeAfterTest extends BrowserConfig {
    protected WebDriverWait wait;
    @BeforeEach
    public void setUp(){
        startChrome();
        driver.get(ValueReadingManager.getInstance().getUrl());
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
    }
    @AfterEach
    public void tearDown(){
        driver.quit();
    }
}
