package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Open;
import utils.ValueReadingManager;

import java.util.Objects;

public class Navigate {
    public static Performable toSaucedemodHome() {

        return Task.where(
                "{0} Open the web page",
                Open.url(Objects.requireNonNull(ValueReadingManager.getInstance()).getUrl())
        );
    }
}
