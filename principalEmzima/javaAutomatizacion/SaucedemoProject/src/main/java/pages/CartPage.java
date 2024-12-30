package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class CartPage extends DescriptionPage {
    @FindBy(id="checkout")
    @CacheLookup
    private WebElement checkoutButton;

    @FindBy(id="continue-shopping")
    @CacheLookup
    private WebElement continueShoppingButton;

    public CartPage (WebDriver driver){
        super(driver);
        PageFactory.initElements(driver,this);
    }

    public void clickCheckout() {
        this.verifyLogin();
        this.checkoutButton.click();
    }

    public void clickContinueShopping() {
        this.verifyLogin();
        this.continueShoppingButton.click();
    }
}
