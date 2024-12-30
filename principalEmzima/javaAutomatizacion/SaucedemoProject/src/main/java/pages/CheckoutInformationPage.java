package pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class CheckoutInformationPage extends CartPage {

    @FindBy(id = "first-name")
    @CacheLookup
    private WebElement firstNameInput;

    @FindBy(id = "last-name")
    @CacheLookup
    private WebElement lastNameInput;

    @FindBy(id = "postal-code")
    @CacheLookup
    private WebElement postalCodeInput;

    @FindBy(id = "cancel")
    @CacheLookup
    private WebElement cancelButton;

    @FindBy(id = "continue")
    @CacheLookup
    private WebElement continueButton;

    public CheckoutInformationPage(WebDriver driver) {
        super(driver);
        PageFactory.initElements(driver, this);
    }

    public void typeFirstNameInput(String nameFirst) {
        this.verifyLogin();
        this.firstNameInput.sendKeys(nameFirst);
    }

    public void typeLastNameInput(String nameLast) {
        this.verifyLogin();
        this.lastNameInput.sendKeys(nameLast);
    }

    public void typePostalCodeInput(String codePostal) {
        this.verifyLogin();
        this.postalCodeInput.sendKeys(codePostal);
    }

    public void clickContinue() {
        this.verifyLogin();
        this.continueButton.click();
    }

    public void clickCancelInformation() {
        this.verifyLogin();
        this.cancelButton.click();
    }

    public void continuePaying(String nameFirst, String nameLast, String codePostal) {
        this.verifyLogin();
        this.typeFirstNameInput(nameFirst);
        this.typeLastNameInput(nameLast);
        this.typePostalCodeInput(codePostal);
        this.clickContinue();
    }

}
