package org.emzima.saucedemo.tasks;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.targets.Target;
import net.serenitybdd.screenplay.ui.Button;

public class ClickExecutions {
    public static Performable buttonByLocator(String keyword, Target locator) {
        return Task.where("{0} clicks on the button containing: " + keyword,
                Click.on(locator)
        );
    }

    public static Performable buttonByNameOrId(String locator) {
        return Task.where("{0} clicks on the button with locator: " + locator,
                Click.on(Button.withNameOrId(locator))
        );
    }
}




