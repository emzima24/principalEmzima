package com.java.selenium;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import pages.*;
import utils.ValueReadingManager;
import org.junit.Test;
import org.openqa.selenium.By;
import java.time.Duration;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class TestPOO extends BeforeAfterTest {

    // e2e sin objeto mostrado en la ultima reunion
    @Test
    public void testE2e(){
        driver.findElement(By.id("user-name")).sendKeys(ValueReadingManager.getInstance().getUsername("prod"));
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

    // prueba 1 relacionada con la clase Login
    @Test
    public void loginTest(){
        LoginPage loginPage = new LoginPage(driver);
        loginPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        WebElement linkedinLink = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"page_wrapper\"]/footer/ul/li[3]/a")));
        assertTrue(linkedinLink.isDisplayed());
    }

    // prueba 1 relacionada con la clase Catalogue
    @Test
    public void catalogueWithLogoutTest(){
        CataloguePage cataloguePage = new CataloguePage(driver);
        cataloguePage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cataloguePage.clickHamburgerMenu();
        cataloguePage.clickLogout();
        WebElement loginButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("login-button")));
        assertTrue(loginButton.isDisplayed());
    }

    // prueba 2 relacionada con la clase Catalogue
    @Test
    public void catalogueWithAddProductTest(){
        CataloguePage cataloguePage = new CataloguePage(driver);;
        cataloguePage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cataloguePage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Backpack"));
        cataloguePage.clickTitle(ValueReadingManager.getInstance().getTitleXpath("Sauce Labs Backpack"));
        cataloguePage.clickCart();
        cataloguePage.clickHamburgerMenu();
        cataloguePage.clickAllItems();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    // prueba 3 relacionada con la clase Catalogue
    @Test
    public void catalogueWithAddProductAndDescriptionTest(){
        CataloguePage cataloguePage = new CataloguePage(driver);;
        cataloguePage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        cataloguePage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Onesie"));
        cataloguePage.clickCart();
        cataloguePage.clickHamburgerMenu();
        cataloguePage.clickResetApp();
        WebElement checkoutButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("checkout")));
        assertTrue(checkoutButton.isDisplayed());
    }

    // prueba 1 relacionada con la clase Description
    @Test
    public void descriptionWithAddProduct(){
        DescriptionPage descriptionPage = new DescriptionPage(driver);;
        descriptionPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        descriptionPage.clickImage(ValueReadingManager.getInstance().getImageXpath("Sauce Labs Onesie"));
        descriptionPage.clickAddToCartDescription();
        descriptionPage.clickCart();
        descriptionPage.clickHamburgerMenu();
        WebElement checkoutButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("checkout")));
        assertTrue(checkoutButton.isDisplayed());
    }

    // prueba 2 relacionada con la clase Description
    @Test
    public void descriptionWithBackProducts(){
        DescriptionPage descriptionPage = new DescriptionPage(driver);;
        descriptionPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        descriptionPage.clickImage(ValueReadingManager.getInstance().getImageXpath("Sauce Labs Backpack"));
        descriptionPage.clickAddToCartDescription();
        descriptionPage.clickBackProducts();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    // prueba 1 relacionada con la clase Cart
    @Test
    public void cartWithAddProductWithContinueShopping() throws InterruptedException {
        CartPage cartPage = new CartPage(driver);;
        cartPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
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

    // prueba 2 relacionada con la clase Cart
    @Test
    public void cartWithAddProductWithCheckout(){
        CartPage cartPage = new CartPage(driver);;
        cartPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
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

    // prueba 1 relacionada con la clase Checkout Information
    @Test
    public void checkoutInformationWithAddProductWithCancel(){
        CheckoutInformationPage checkoutInformation = new CheckoutInformationPage(driver);;
        checkoutInformation.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutInformation.clickCart();
        checkoutInformation.clickCheckout();
        checkoutInformation.typeFirstNameInput(ValueReadingManager.getInstance().getFirstName("1"));
        checkoutInformation.typeLastNameInput(ValueReadingManager.getInstance().getLastName("1"));
        checkoutInformation.typePostalCodeInput(ValueReadingManager.getInstance().getPostalCode("1"));
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        checkoutInformation.clickCancelInformation();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Your Cart",titleHeadBar.getText());
    }

    // prueba 2 relacionada con la clase Checkout Information
    @Test
    public void checkoutInformationWithAddProductWithContinue(){
        CheckoutInformationPage checkoutInformation = new CheckoutInformationPage(driver);;
        checkoutInformation.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutInformation.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutInformation.clickCart();
        checkoutInformation.clickCheckout();
        checkoutInformation.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Checkout: Overview",titleHeadBar.getText());
    }

    // prueba 1 relacionada con la clase Checkout Overview
    @Test
    public void checkoutOverviewWithAddProductWithCancel(){
        CheckoutOverviewPage checkoutOverviewPage = new CheckoutOverviewPage(driver);;
        checkoutOverviewPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutOverviewPage.clickCart();
        checkoutOverviewPage.clickCheckout();
        checkoutOverviewPage.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        checkoutOverviewPage.clickCancelOverview();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    // prueba 2 relacionada con la clase Checkout Overview
    @Test
    public void checkoutOverviewWithAddProductWithFinish(){
        CheckoutOverviewPage checkoutOverviewPage = new CheckoutOverviewPage(driver);;
        checkoutOverviewPage.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Onesie"));
        checkoutOverviewPage.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Fleece Jacket"));
        checkoutOverviewPage.clickCart();
        checkoutOverviewPage.clickCheckout();
        checkoutOverviewPage.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        checkoutOverviewPage.clickFinish();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Checkout: Complete!",titleHeadBar.getText());
    }

    // prueba 1 relacionada con la clase Checkout Complete
    @Test
    public void checkoutCompleteWithAddProductWithBackHome(){
        CheckoutCompletePage checkoutComplete = new CheckoutCompletePage(driver);;
        checkoutComplete.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutComplete.clickCart();
        checkoutComplete.clickCheckout();
        checkoutComplete.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        checkoutComplete.clickFinish();
        checkoutComplete.clickBackHome();
        WebElement titleHeadBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"header_container\"]/div[2]/span")));
        assertEquals("Products",titleHeadBar.getText());
    }

    // prueba e2e
    @Test
    public void checkoutCompleteWithAddProductWithLogout(){
        CheckoutCompletePage checkoutComplete = new CheckoutCompletePage(driver);;
        checkoutComplete.loginAll(ValueReadingManager.getInstance().getUsername("prod"),ValueReadingManager.getInstance().getPassword("prod"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Sauce Labs Bike Light"));
        checkoutComplete.clickAddToCart(ValueReadingManager.getInstance().getAddId("Test.allTheThings() T-Shirt (Red)"));
        checkoutComplete.clickCart();
        checkoutComplete.clickCheckout();
        checkoutComplete.continuePaying(ValueReadingManager.getInstance().getFirstName("1"),ValueReadingManager.getInstance().getLastName("1"), ValueReadingManager.getInstance().getPostalCode("1"));
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        checkoutComplete.clickFinish();
        checkoutComplete.clickBackHome();
        checkoutComplete.clickHamburgerMenu();
        checkoutComplete.clickLogout();
        WebElement loginButton = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("login-button")));
        assertTrue(loginButton.isDisplayed());
    }
}