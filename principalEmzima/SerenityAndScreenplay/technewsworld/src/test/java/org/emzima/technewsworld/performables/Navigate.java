package org.emzima.technewsworld.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Open;

public class Navigate {
    public static Performable toTechnewsworldHome() {

        return Task.where(
                "{0} Open the web page",
                Open.url("https://www.technewsworld.com/")
        );
    }
}
