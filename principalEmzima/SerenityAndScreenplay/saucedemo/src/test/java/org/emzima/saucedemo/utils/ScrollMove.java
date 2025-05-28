package org.emzima.saucedemo.utils;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.abilities.BrowseTheWeb;

import org.openqa.selenium.JavascriptExecutor;

public class ScrollMove implements Task {

    private final int pixels;

    public ScrollMove(int pixels) {
        this.pixels = pixels;
    }

    public static ScrollMove by(int pixels) {
        return Tasks.instrumented(ScrollMove.class, pixels);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        String script = String.format("window.scrollBy(0, %d);", pixels);
        ((JavascriptExecutor) BrowseTheWeb.as(actor).getDriver()).executeScript(script);
    }
}