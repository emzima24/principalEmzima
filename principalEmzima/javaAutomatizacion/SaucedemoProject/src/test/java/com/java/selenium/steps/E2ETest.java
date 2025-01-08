package com.java.selenium.steps;

import common.ScreenshotUtil;
import common.BrowserConfig;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.qameta.allure.Allure;
import org.junit.jupiter.api.DisplayName;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import pages.CheckoutCompletePage;
import utils.ValueReadingManager;

import java.time.Duration;
import java.util.Objects;

import static org.junit.jupiter.api.Assertions.assertTrue;


public class E2ETest extends BrowserConfig {
    CheckoutCompletePage checkoutComplete;
    public WebDriverWait wait;

    @DisplayName("prueba e2e con POO")
    @Given("I go to the website as a registered user")
    public void iGoToTheWebsiteAsARegisteredUser() {
        startChrome();
        driver.get(Objects.requireNonNull(ValueReadingManager.getInstance()).getUrl());
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        checkoutComplete = new CheckoutCompletePage(driver);
    }
    @When("I enter the username and password")
    public void iEnterTheUsernameAndPassword() {
        checkoutComplete.typeUserName(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"));
        checkoutComplete.typePassword(ValueReadingManager.getInstance().getPassword("prod"));
        ScreenshotUtil.captureAndAttachScreenshot(driver,"prueba");
    }

    @And("I click on Login button")
    public void iClickOnLoginButton() {
        checkoutComplete.clickLogin();
    }

    @And("I click on the Add to cart button for the {string}")
    public void iClickOnTheAddToCartButtonForThe(String value) {
        checkoutComplete.clickAddToCart(value= Objects.requireNonNull(ValueReadingManager.getInstance()).getAddId("Test.allTheThings() T-Shirt (Red)"));
        Allure.parameter("Product",value);
    }

    @And("I click on the cart icon")
    public void iClickOnTheCartIcon() {
        checkoutComplete.clickCart();
    }

    @And("I click on the Checkout button")
    public void iClickOnTheCheckoutButton() {
        checkoutComplete.clickCheckout();
    }

    @And("I filled the field for the first_name with value first_name")
    public void iFilledTheFieldForTheFirst_nameWith() {
        checkoutComplete.typeFirstNameInput(Objects.requireNonNull(ValueReadingManager.getInstance()).getFirstName("1"));
    }

    @And("I filled the field for the last_name with value last_name")
    public void iFilledTheFieldForTheLast_nameWith() {
        checkoutComplete.typeLastNameInput(Objects.requireNonNull(ValueReadingManager.getInstance()).getLastName("1"));
    }

    @And("I filled the field for the zip_code with value zip_code")
    public void iFilledTheFieldForTheZip_codeWith() {
        checkoutComplete.typePostalCodeInput(Objects.requireNonNull(ValueReadingManager.getInstance()).getPostalCode("1"));
    }

    @And("I click on the Continue button")
    public void iClickOnTheContinueButton() {
        checkoutComplete.clickContinue();
    }

    @And("I click on the Finish button")
    public void iClickOnTheFinishButton() {
        checkoutComplete.clickFinish();
    }

    @And("I click on the Back Home button")
    public void iClickOnTheBackHomeButton() {
        checkoutComplete.clickBackHome();
    }

    @And("I display the hamburger menu")
    public void iDisplayTheHamburgerMenu() {
        checkoutComplete.clickHamburgerMenu();
    }

    @And("I log out")
    public void iLogOut() {
        checkoutComplete.clickLogout();
    }

    @Then("I want to go to the login page")
    public void iWantToGoToTheLoginPage() {
        WebElement loginButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("login-button")));
        assertTrue(loginButton.isDisplayed());
        driver.quit();
    }
}


