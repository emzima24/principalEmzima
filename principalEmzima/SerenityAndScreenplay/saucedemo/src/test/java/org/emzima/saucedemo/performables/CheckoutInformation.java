package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import org.emzima.saucedemo.tasks.ClickExecutions;
import org.emzima.saucedemo.tasks.EnterIntoTheField;

import static org.emzima.saucedemo.targets.CheckoutInformationTarget.*;

import utils.ValueReadingManager;

import java.util.Objects;
public class CheckoutInformation {
    public static Performable typeFirstName() {

        return Task.where(
                "{1} Write first name",
                EnterIntoTheField.byLocator(
                        Objects.requireNonNull(
                                ValueReadingManager.getInstance()
                        ).getFirstName("1"),
                        FIRST_NAME)
        );
    }
    public static Performable typeLastName() {

        return Task.where(
                "{1} Write last name",
                EnterIntoTheField.byLocator(
                        Objects.requireNonNull(
                                ValueReadingManager.getInstance()
                        ).getLastName("1"),
                        LAST_NAME)
        );
    }
    public static Performable typePostalCode() {

        return Task.where(
                "{1} Write postal code",
                EnterIntoTheField.byLocator(
                        Objects.requireNonNull(
                                ValueReadingManager.getInstance()
                        ).getPostalCode("1"),
                        POSTAL_CODE)
        );
    }
    public static Performable clickContinueButton() {

        return Task.where(
                "{3} Click on the continue button",
                ClickExecutions.buttonByLocator("Continue button",CONTINUE_BUTTON)
        );
    }
    public static Performable clickCancelButton() {

        return Task.where(
                "{3} Click on the cancel button",
                ClickExecutions.buttonByLocator("Cancel button",CANCEL_BUTTON)
        );
    }
    public static Performable fillInvoiceData() {

        return Task.where(
                "{1} Enter first name, last name zip/postal code and click in continue button in one step with valid credentials",
                typeFirstName(),
                typeLastName(),
                typePostalCode(),
                clickContinueButton()
        );
    }
}
