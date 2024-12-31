package com.java.selenium.steps;

import common.BrowserConfig;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.jupiter.api.DisplayName;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import pages.CheckoutCompletePage;
import utils.ValueReadingManager;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertTrue;


public class E2ETest extends BrowserConfig {
    CheckoutCompletePage checkoutComplete;
    public WebDriverWait wait;

    @DisplayName("prueba e2e con POO")
    @Given("I go to the website as a registered user")
    public void iGoToTheWebsiteAsARegisteredUser() {
        startChrome();
        driver.get(ValueReadingManager.getInstance().getUrl());
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        checkoutComplete = new CheckoutCompletePage(driver);
    }
    @When("I enter the username and password")
    public void iEnterTheUsernameAndPassword() {
        checkoutComplete.typeUserName(ValueReadingManager.getInstance().getUsername("prod"));
        checkoutComplete.typePassword(ValueReadingManager.getInstance().getPassword("prod"));
    }

    @And("I click on Login button")
    public void iClickOnLoginButton() {
        checkoutComplete.clickLogin();
    }

    @And("I click on the Add to cart button for the {string}")
    public void iClickOnTheAddToCartButtonForThe(String value) {
        checkoutComplete.clickAddToCart(value=ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
    }

    @And("I click on the cart icon")
    public void iClickOnTheCartIcon() {
        checkoutComplete.clickCart();
    }

    @And("I click on the Checkout button")
    public void iClickOnTheCheckoutButton() {
        checkoutComplete.clickCheckout();
    }

    @And("I filled the field for the first_name with {string}")
    public void iFilledTheFieldForTheFirst_nameWith(String value) {
        checkoutComplete.typeFirstNameInput(value=ValueReadingManager.getInstance().getFirstName("1"));
    }

    @And("I filled the field for the last_name with {string}")
    public void iFilledTheFieldForTheLast_nameWith(String value) {
        checkoutComplete.typeLastNameInput(value=ValueReadingManager.getInstance().getLastName("1"));
    }

    @And("I filled the field for the zip_code with {string}")
    public void iFilledTheFieldForTheZip_codeWith(String value) {
        checkoutComplete.typePostalCodeInput(value=ValueReadingManager.getInstance().getPostalCode("1"));
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


