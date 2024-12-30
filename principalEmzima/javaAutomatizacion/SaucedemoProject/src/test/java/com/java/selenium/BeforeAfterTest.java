package com.java.selenium;

import common.BrowserConfig;
import org.junit.After;
import org.junit.Before;
import org.openqa.selenium.support.ui.WebDriverWait;
import utils.ValueReadingManager;

import java.time.Duration;

public class BeforeAfterTest extends BrowserConfig {
    protected WebDriverWait wait;
    @Before
    public void setUp(){
        startChrome();
        driver.get(ValueReadingManager.getInstance().getUrl());
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
    }
    @After
    public void tearDown(){
        driver.quit();
    }
}
