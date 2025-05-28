package org.emzima.saucedemo.tasks;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Enter;
import net.serenitybdd.screenplay.targets.Target;

public class EnterIntoTheField {
    public static Performable byLocator(String value, Target field) {
        return Task.where("{0} enters '" + value + "' into field",
                Enter.theValue(value).into(field)
        );
    }

    public static Performable byNameOrId(String value, String locator) {
        return Task.where("{0} enters value into field with locator: " + locator,
                Enter.theValue(value).into(Target.the(locator).locatedBy(locator))
        );
    }
}





