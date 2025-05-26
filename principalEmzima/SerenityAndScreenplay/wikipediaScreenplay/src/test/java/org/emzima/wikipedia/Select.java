package org.emzima.wikipedia;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.ui.Link;

public class Select {
    public static Performable firstResult() {
        return Task.where("{0} navigates to the first Wikipedia result",
                Click.on(Link.locatedBy(".mw-search-results li:first-child .mw-search-result-heading a"))
        );
    }
}