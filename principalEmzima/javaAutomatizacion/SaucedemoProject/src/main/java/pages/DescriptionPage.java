package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class DescriptionPage extends CataloguePage {

    @FindBy(id = "add-to-cart")
    @CacheLookup
    private WebElement  addToCartButton;

    @FindBy(id = "back-to-products")
    @CacheLookup
    private WebElement  backProductsButton;


    public DescriptionPage (WebDriver driver) {
        super(driver);
        PageFactory.initElements(driver,this);
    }

    public void clickAddToCartDescription() {
        this.verifyLogin();
        this.addToCartButton.click();
    }

    public void clickBackProducts() {
        this.verifyLogin();
        this.backProductsButton.click();
    }
}
