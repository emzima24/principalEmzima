package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.time.Duration;

public class CataloguePage extends LoginPage {
    @FindBy(id="react-burger-menu-btn")
    @CacheLookup
    private WebElement hamburgerMenu;

    @FindBy(xpath="//*[@id=\"shopping_cart_container\"]/a")
    @CacheLookup
    private WebElement cartLink;

    @FindBy(id= "inventory_sidebar_link")
    @CacheLookup
    private WebElement allItemsLink;

    @FindBy(id= "logout_sidebar_link")
    @CacheLookup
    private WebElement logoutLink;

    @FindBy(id= "reset_sidebar_link")
    @CacheLookup
    private WebElement resetAppLink;

    @FindBy(id="login-button")
    @CacheLookup
    private WebElement loginButton;

    WebElement addToCartButton, titleLink, imageLink;

    public CataloguePage (WebDriver driver){
        super(driver);
        PageFactory.initElements(driver,this);
    }

    public void verifyLogin() {
        if (!this.isLoggedIn) {
            throw new IllegalStateException("Debes iniciar sesión primero usando la función login() heredada de Login.");
        }
    }

    public void clickHamburgerMenu() {
        this.verifyLogin();
        this.hamburgerMenu.click();
        this.wait.until(ExpectedConditions.visibilityOf(resetAppLink));
    }

    public void clickAllItems() {
        this.verifyLogin();
        this.allItemsLink.click();
    }

    public void clickLogout() {
        this.verifyLogin();
        this.logoutLink.click();
        try {
            this.wait.until(ExpectedConditions.visibilityOf(loginButton));
            this.isLoggedIn = !loginButton.isDisplayed();
        } catch (Exception e) {
            this.isLoggedIn = true;
            e.printStackTrace();
        }
    }

    public void clickResetApp() {
        this.verifyLogin();
        this.resetAppLink.click();
    }

    public void clickCart() {
        this.verifyLogin();
        this.cartLink.click();
    }

    public void clickAddToCart(String product) {
        this.verifyLogin();
        addToCartButton = wait.until(ExpectedConditions.elementToBeClickable(By.id(product)));
        addToCartButton.click();
    }

    public void clickTitle(String product) {
        this.verifyLogin();
        titleLink = wait.until(ExpectedConditions.elementToBeClickable(By.xpath(product)));
        titleLink.click();
    }

    public void clickImage(String product) {
        this.verifyLogin();
        imageLink = wait.until(ExpectedConditions.elementToBeClickable(By.xpath(product)));
        imageLink.click();
    }
}
