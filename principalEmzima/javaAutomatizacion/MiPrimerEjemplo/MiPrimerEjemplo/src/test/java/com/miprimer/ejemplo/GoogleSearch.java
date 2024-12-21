package com.miprimer.ejemplo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.assertEquals;

public class GoogleSearch {
    private WebDriver driver;

    @Before
    public void setUp(){
        System.setProperty("webdriver.chrome.driver","./src/test/resources/cromedriver/chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://www.google.com");
    }
    @Test
    public void testPage(){
        WebElement searchInput = driver.findElement(By.name("q"));
        searchInput.sendKeys("https://egg.live");
        searchInput.submit();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        WebElement firstResult = driver.findElement(By.xpath("//h3[contains(@class, 'LC20lb')]"));
        firstResult.click();
        assertEquals("Egg",driver.getTitle());
    }
    @After
    public void tearDown(){
        driver.quit();
    }

}
