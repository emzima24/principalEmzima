package com.java.selenium;

import org.junit.jupiter.api.DisplayName;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import pages.*;
import utils.ValueReadingManager;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import java.time.Duration;
import java.util.Objects;

import static org.junit.jupiter.api.Assertions. assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestPOO extends BeforeAfterTest {

    @DisplayName("Prueba e2e como fue mostrado en la ultima reunion sin POO")
    @Test
    public void testE2e(){
        driver.findElement(By.id("user-name")).sendKeys(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"));
        driver.findElement(By.id("password")).sendKeys(ValueReadingManager.getInstance().getPassword("prod"));
        driver.findElement(By.id("login-button")).submit();
        assertEquals("Swag Labs",driver.getTitle());


        // esta parte decides si incluirla o no
        driver.findElement(By.id(ValueReadingManager.getInstance().getAddId("Sauce Labs Bolt T-Shirt"))).click();
        driver.findElement(By.xpath("//*[@id=\"shopping_cart_container\"]/a")).click();
        driver.findElement(By.id("checkout")).click();

        try {
            Thread.sleep(3000);


            driver.findElement(By.id("first-name")).sendKeys(ValueReadingManager.getInstance().getFirstName("1"));
            driver.findElement(By.id("last-name")).sendKeys(ValueReadingManager.getInstance().getLastName("1"));
            driver.findElement(By.id("postal-code")).sendKeys(ValueReadingManager.getInstance().getPostalCode("1"));
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

    @DisplayName("Prueba 1 relacionada con la clase Login con POO")
    @Test
    public void loginTest(){
        LoginPage loginPage = new LoginPage(driver);
        loginPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        WebElement linkedinLink = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"page_wrapper\"]/footer/ul/li[3]/a")));
        assertTrue(linkedinLink.isDisplayed());
    }

    @DisplayName("Prueba 1 relacionada con la clase Catalogue con POO")
    @Test
    public void catalogueWithLogoutTest(){
        CataloguePage cataloguePage = new CataloguePage(driver);
        cataloguePage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cataloguePage.clickHamburgerMenu();
        cataloguePage.clickLogout();
        WebElement loginButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("login-button")));
        assertTrue(loginButton.isDisplayed());
    }

    @DisplayName("Prueba 2 relacionada con la clase Catalogue con POO")
    @Test
    public void catalogueWithAddProductTest(){
        CataloguePage cataloguePage = new CataloguePage(driver);;
        cataloguePage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cataloguePage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Backpack"));
        cataloguePage.clickTitle(ValueReadingManager.getInstance().getTitleXpath("Sauce Labs Backpack"));
        cataloguePage.clickCart();
        cataloguePage.clickHamburgerMenu();
        cataloguePage.clickAllItems();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    @DisplayName("Prueba 3 relacionada con la clase Catalogue con POO")
    @Test
    public void catalogueWithAddProductAndDescriptionTest(){
        CataloguePage cataloguePage = new CataloguePage(driver);;
        cataloguePage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cataloguePage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Onesie"));
        cataloguePage.clickCart();
        cataloguePage.clickHamburgerMenu();
        cataloguePage.clickResetApp();
        WebElement checkoutButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("checkout")));
        assertTrue(checkoutButton.isDisplayed());
    }

    @DisplayName("Prueba 1 relacionada con la clase Description con POO")
    @Test
    public void descriptionWithAddProduct(){
        DescriptionPage descriptionPage = new DescriptionPage(driver);;
        descriptionPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        descriptionPage.clickImage(ValueReadingManager.getInstance().getImageXpath("Sauce Labs Onesie"));
        descriptionPage.clickAddToCartDescription();
        descriptionPage.clickCart();
        descriptionPage.clickHamburgerMenu();
        WebElement checkoutButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("checkout")));
        assertTrue(checkoutButton.isDisplayed());
    }

    @DisplayName("Prueba 2 relacionada con la clase Description con POO")
    @Test
    public void descriptionWithBackProducts(){
        DescriptionPage descriptionPage = new DescriptionPage(driver);;
        descriptionPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        descriptionPage.clickImage(ValueReadingManager.getInstance().getImageXpath("Sauce Labs Backpack"));
        descriptionPage.clickAddToCartDescription();
        descriptionPage.clickBackProducts();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    @DisplayName("Prueba 1 relacionada con la clase Cart con POO")
    @Test
    public void cartWithAddProductWithContinueShopping() throws InterruptedException {
        CartPage cartPage = new CartPage(driver);;
        cartPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cartPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Onesie"));
        cartPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bolt T-Shirt"));
        cartPage.clickCart();
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        cartPage.clickContinueShopping();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    @DisplayName("Prueba 2 relacionada con la clase Cart con POO")
    @Test
    public void cartWithAddProductWithCheckout(){
        CartPage cartPage = new CartPage(driver);;
        cartPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cartPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Fleece Jacket"));
        cartPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bolt T-Shirt"));
        cartPage.clickCart();
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        cartPage.clickCheckout();
        WebElement continueButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("continue")));
        assertTrue(continueButton.isDisplayed());
    }

    @DisplayName("Prueba 1 relacionada con la clase Checkout Information con POO")
    @Test
    public void checkoutInformationWithAddProductWithCancel(){
        CheckoutInformationPage checkoutInformation = new CheckoutInformationPage(driver);;
        checkoutInformation.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutInformation.clickCart();
        checkoutInformation.clickCheckout();
        checkoutInformation.typeFirstNameInput(ValueReadingManager.getInstance().getFirstName("1"));
        checkoutInformation.typeLastNameInput(ValueReadingManager.getInstance().getLastName("1"));
        checkoutInformation.typePostalCodeInput(ValueReadingManager.getInstance().getPostalCode("1"));
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        checkoutInformation.clickCancelInformation();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Your Cart",titleHeadBar.getText());
    }

    @DisplayName("prueba 2 relacionada con la clase Checkout Informationcon  POO")
    @Test
    public void checkoutInformationWithAddProductWithContinue(){
        CheckoutInformationPage checkoutInformation = new CheckoutInformationPage(driver);;
        checkoutInformation.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutInformation.clickCart();
        checkoutInformation.clickCheckout();
        checkoutInformation.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Checkout: Overview",titleHeadBar.getText());
    }

    @DisplayName("prueba 1 relacionada con la clase Checkout Overview con POO")
    @Test
    public void checkoutOverviewWithAddProductWithCancel(){
        CheckoutOverviewPage checkoutOverviewPage = new CheckoutOverviewPage(driver);;
        checkoutOverviewPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutOverviewPage.clickCart();
        checkoutOverviewPage.clickCheckout();
        checkoutOverviewPage.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        checkoutOverviewPage.clickCancelOverview();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    @DisplayName("prueba 2 relacionada con la clase Checkout Overview con POO")
    @Test
    public void checkoutOverviewWithAddProductWithFinish(){
        CheckoutOverviewPage checkoutOverviewPage = new CheckoutOverviewPage(driver);;
        checkoutOverviewPage.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Onesie"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Fleece Jacket"));
        checkoutOverviewPage.clickCart();
        checkoutOverviewPage.clickCheckout();
        checkoutOverviewPage.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        checkoutOverviewPage.clickFinish();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Checkout: Complete!",titleHeadBar.getText());
    }

    @DisplayName("prueba 1 relacionada con la clase Checkout Complete con POO")
    @Test
    public void checkoutCompleteWithAddProductWithBackHome(){
        CheckoutCompletePage checkoutComplete = new CheckoutCompletePage(driver);;
        checkoutComplete.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutComplete.clickCart();
        checkoutComplete.clickCheckout();
        checkoutComplete.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        checkoutComplete.clickFinish();
        checkoutComplete.clickBackHome();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    @DisplayName("prueba e2e con POO")
    @Test
    public void checkoutCompleteWithAddProductWithLogout(){
        CheckoutCompletePage checkoutComplete = new CheckoutCompletePage(driver);
        checkoutComplete.loginAll(Objects.requireNonNull(ValueReadingManager.getInstance()).getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutComplete.clickCart();
        checkoutComplete.clickCheckout();
        checkoutComplete.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        checkoutComplete.clickFinish();
        checkoutComplete.clickBackHome();
        checkoutComplete.clickHamburgerMenu();
        checkoutComplete.clickLogout();
        WebElement loginButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("login-button")));
        assertTrue(loginButton.isDisplayed());
    }
}