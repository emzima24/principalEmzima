package org.emzima.saucedemo;

import net.serenitybdd.screenplay.ensure.Ensure;
import net.serenitybdd.annotations.Managed;
import net.serenitybdd.screenplay.abilities.BrowseTheWeb;
import net.serenitybdd.annotations.WithTag;
import net.serenitybdd.junit5.SerenityJUnit5Extension;
import net.serenitybdd.screenplay.Actor;

import org.emzima.saucedemo.ensures.ValidateCartItems;
import org.emzima.saucedemo.performables.*;
import org.emzima.saucedemo.utils.WaitUtils;
import static org.emzima.saucedemo.targets.CartTarget.CART_ICON;
import static org.emzima.saucedemo.targets.InventoryTarget.BURGUER_MENU;

import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;

import org.openqa.selenium.WebDriver;

@WithTag("list, search contains")
@ExtendWith(SerenityJUnit5Extension.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class SaucedemoStoryTest {

    @Managed
    WebDriver hisBrowser;
    Actor saucedemoTeams;

    @BeforeEach
    void prepare() {
        hisBrowser.manage().window().maximize();
        saucedemoTeams = Actor.named("Saucedemo_teams");
        saucedemoTeams.can(BrowseTheWeb.with(hisBrowser));
    }

    //@Disabled("Temporarily ignored until case #4 is resolved")
    @WithTag("login&logout")
    @Test
    @Order(1)
    public void sacucedemoLoginSessionVerify() {

        saucedemoTeams.attemptsTo(
                Navigate.toSaucedemodHome(),
                Login.typeUsername(),
                Login.typePassword(),
                Login.clickLoginButton(),
                Ensure.that(CART_ICON).isDisplayed()
                );
    }

    @WithTag("E2E")
    @Test
    @Order(4)
    public void buyRandomsProductsCompleteProcessVerify() {
        saucedemoTeams.attemptsTo(
                //Uso de wait forzado porque mi chrome ultima version esta con mi usuario configurado
                // y sale una ventana de contraseñas inseguras que esta fuera del DOM
                Navigate.toSaucedemodHome(),
                Login.withCredentials(),
                WaitUtils.pauseForMilliseconds(5000),
                Catalogue.loadAnyQuantityProductsIntoCart(),
                WaitUtils.pauseForMilliseconds(5000),
                Cart.goToCart(),
                Cart.goToContinueCheckout(),
                CheckoutInformation.fillInvoiceData(),
                CheckoutOverview.clickFinishButton(),
                Ensure.that(CheckoutComplete.getTitle())
                        .isEqualTo("Checkout: Complete!"),
                Ensure.that(CheckoutComplete.getMessageComplete())
                        .isEqualTo("Thank you for your order!"),
                CheckoutComplete.clickBackHomeButton(),
                Logout.performLogout(),
                Ensure.that(CART_ICON).isNotDisplayed()
                );
    }

    //@Disabled("Temporarily ignored until case #3 is resolved")
    @WithTag("cartRemove")
    @Test
    @Order(3)
    public void removeItemsFromCartVerify() {
        saucedemoTeams.attemptsTo(
                //Uso de wait forzado porque mi chrome ultima version esta con mi usuario configurado
                // y sale una ventana de contraseñas inseguras que esta fuera del DOM
                Navigate.toSaucedemodHome(),
                Login.withCredentials(),
                WaitUtils.pauseForMilliseconds(5000),
                Catalogue.loadAnyQuantityProductsIntoCart(),
                WaitUtils.pauseForMilliseconds(5000),
                Cart.goToCart(),
                ValidateCartItems.quantity(),
                Cart.removeByName("Sauce Labs Onesie"),
                WaitUtils.pauseForMilliseconds(5000),
                ValidateCartItems.quantity()
                );
    }

    //@Disabled("Temporarily ignored until case #3 is resolved")
    @WithTag("login&logout")
    @Test
    @Order(2)
    public void sacucedemoLogoutSessionVerify() {
        saucedemoTeams.attemptsTo(
                Navigate.toSaucedemodHome(),
                Login.withCredentials(),
                Logout.openBurgerMenu(),
                Logout.selectLogoutOption(),
                Ensure.that(CART_ICON).isNotDisplayed(),
                Ensure.that(BURGUER_MENU).isNotDisplayed()
        );
    }
}
