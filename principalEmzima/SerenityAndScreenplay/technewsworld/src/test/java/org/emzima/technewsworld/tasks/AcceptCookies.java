package org.emzima.technewsworld.tasks;

import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.waits.WaitUntil;
import org.emzima.technewsworld.utils.IsElementPresent;

import static net.serenitybdd.screenplay.conditions.Check.whether;
import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isClickable;
import static org.emzima.technewsworld.targets.CookieBannerTarget.ACCEPT_COOKIES_BUTTON;

public class AcceptCookies {
    public static Task ifPresent() {
        return Task.where("{0.2} accepts the use of cookies, if present",
                whether(IsElementPresent.forTarget(ACCEPT_COOKIES_BUTTON))
                        .andIfSo(
                                WaitUntil.the(ACCEPT_COOKIES_BUTTON, isClickable()).forNoMoreThan(4).seconds(),
                                Click.on(ACCEPT_COOKIES_BUTTON)
                        )
        );
    }
}
