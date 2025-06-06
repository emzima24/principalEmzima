package com.miprimer.ejemplo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.time.Duration;

import static org.junit.Assert.assertEquals;

public class SaucedemoLogin {
    private WebDriver driver;
    @Before
    public void setUp(){
        System.setProperty("webdriver.chrome.driver","./src/test/resources/cromedriver/chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://www.saucedemo.com/");
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
    }
    @Test
    public void testPage(){
        driver.findElement(By.id("user-name")).sendKeys("standard_user");
        driver.findElement(By.id("password")).sendKeys("secret_sauce");
        driver.findElement(By.id("login-button")).submit();
        assertEquals("Swag Labs",driver.getTitle());


        // esta parte decides si incluirla o no
        driver.findElement(By.id("add-to-cart-sauce-labs-bolt-t-shirt")).click();
        driver.findElement(By.xpath("//*[@id=\"shopping_cart_container\"]/a")).click();
        driver.findElement(By.id("checkout")).click();

        try {
            Thread.sleep(3000);


        driver.findElement(By.id("first-name")).sendKeys("Carlos");
        driver.findElement(By.id("last-name")).sendKeys("Alonso");
        driver.findElement(By.id("postal-code")).sendKeys("C1249SAV");
        driver.findElement(By.id("continue")).submit();
        driver.findElement(By.id("finish")).click();

            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        driver.findElement(By.id("react-burger-menu-btn")).click();
        driver.findElement(By.id("logout_sidebar_link")).click();
        assertEquals("Swag Labs",driver.getTitle());

    }
    @After
    public void tearDown(){
        driver.quit();
    }
}
