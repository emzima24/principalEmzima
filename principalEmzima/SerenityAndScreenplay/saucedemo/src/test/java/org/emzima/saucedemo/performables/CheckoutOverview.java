package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;

import org.emzima.saucedemo.tasks.ClickExecutions;

import static org.emzima.saucedemo.targets.CheckoutOverviewTarget.CANCEL_BUTTON;
import static org.emzima.saucedemo.targets.CheckoutOverviewTarget.FINISH_BUTTON;
public class CheckoutOverview {
    public static Performable clickFinishButton() {

        return Task.where(
                "{3} Click on the finish button",
                ClickExecutions.buttonByLocator("Finish button",FINISH_BUTTON)
        );
    }
    public static Performable clickCancelButton() {

        return Task.where(
                "{3} Click on the cancel button",
                ClickExecutions.buttonByLocator("Cancel button",CANCEL_BUTTON)
        );
    }
}
