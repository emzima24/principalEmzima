package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class CheckoutOverviewPage extends CheckoutInformationPage {
    @FindBy(id="finish")
    @CacheLookup
    private WebElement finishButton;

    public CheckoutOverviewPage (WebDriver driver){
        super(driver);
        PageFactory.initElements(driver,this);
    }

    public void clickFinish() {
        this.verifyLogin();
        this.finishButton.click();
    }

    public void clickCancelOverview() {
        super.clickCancelInformation();
    }

}
