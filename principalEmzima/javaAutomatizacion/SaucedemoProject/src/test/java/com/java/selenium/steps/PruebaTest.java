package com.java.selenium.steps;

import common.BrowserConfig;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class PruebaTest extends BrowserConfig {

    public WebDriverWait wait;
    @Given("I open Google page")
    public void iOpenGooglePage(){
        startChrome();
        driver.get("https://www.google.com");
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));;
    }
    @When("I write in the search bar {string}")
    public void iWriteInTheSearchBar(String value) {
        driver.findElement(By.name("q")).sendKeys(value="https://egg.live");
    }

    @Then("I see {string} in the title")
    public void iSeeInTheTitle(String value) {
        assertEquals("Google",driver.getTitle());
        driver.quit();
    }
}
