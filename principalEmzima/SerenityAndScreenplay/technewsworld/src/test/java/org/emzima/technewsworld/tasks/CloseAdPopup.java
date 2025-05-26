package org.emzima.technewsworld.tasks;

import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.waits.WaitUntil;

import org.emzima.technewsworld.utils.IsElementPresent;

import static net.serenitybdd.screenplay.conditions.Check.whether;
import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isClickable;

import static org.emzima.technewsworld.targets.PopUpTarget.POPUP_CLOSE_BUTTON;

public class CloseAdPopup {
    public static Task ifPresent() {
        return Task.where("{0.1} closes the popup, if present",
                whether(IsElementPresent.forTarget(POPUP_CLOSE_BUTTON))
                        .andIfSo(
                                WaitUntil.the(POPUP_CLOSE_BUTTON, isClickable()).forNoMoreThan(4).seconds(),
                                Click.on(POPUP_CLOSE_BUTTON)
                        )
        );
    }
}