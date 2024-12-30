package pages;

import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.NoSuchElementException;

import java.time.Duration;

public class LoginPage {
    @FindBy(id="user-name")
    @CacheLookup
    private WebElement userNameTxt;

    @FindBy(id="password")
    @CacheLookup
    private WebElement passwordTxt;

    @FindBy(id="login-button")
    @CacheLookup
    private WebElement loginButton;

    @FindBy(xpath="//*[@id=\"page_wrapper\"]/footer/ul/li[3]/a")
    @CacheLookup
    private WebElement linkedinLink;

    protected boolean isLoggedIn = false;
    public WebDriverWait wait;

    public LoginPage(WebDriver driver){
        this.wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        PageFactory.initElements(driver, this);
    }

    public void typeUserName(String userName) {
        this.userNameTxt.sendKeys(userName);
    }

    public void typePassword(String password) {
        this.passwordTxt.sendKeys(password);
    }

    public void clickLogin() {
        this.loginButton.click();
        try {
            this.wait.until(ExpectedConditions.visibilityOf(linkedinLink));
            this.isLoggedIn = linkedinLink.isDisplayed();
        } catch (Exception e) {
            this.isLoggedIn = false;
        }
    }

    public void loginAll(String userName, String password) {
        typeUserName(userName);
        typePassword(password);
        clickLogin();
    }
}