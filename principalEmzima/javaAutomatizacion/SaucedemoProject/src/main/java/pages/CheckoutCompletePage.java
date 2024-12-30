package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

public class CheckoutCompletePage extends CheckoutOverviewPage {
    public CheckoutCompletePage (WebDriver driver){
        super(driver);
        PageFactory.initElements(driver,this);
    }

    public void clickBackHome() {
        super.clickBackProducts();
    }
}
