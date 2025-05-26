package org.emzima.technewsworld.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.actions.Scroll;
import net.serenitybdd.screenplay.waits.WaitUntil;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isClickable;

import org.emzima.technewsworld.tasks.AcceptCookies;
import org.emzima.technewsworld.tasks.CloseAdPopup;
import org.emzima.technewsworld.utils.ScrollMove;
import org.emzima.technewsworld.utils.ScrollThroughArticles;
import org.emzima.technewsworld.utils.WaitFor;

import static org.emzima.technewsworld.targets.HardwareTarget.HARDWARE_SECTION;
import static org.emzima.technewsworld.targets.HardwareTarget.TECHNEWSWORLD_CHANNELS;

public class SelectHardwareSection {
    public static Performable fromMainMenu() {
        return Task.where(
                "{1} Access the Hardware section",
                CloseAdPopup.ifPresent(),
                AcceptCookies.ifPresent(),
                Scroll.to(TECHNEWSWORLD_CHANNELS),
                WaitFor.seconds(2),
                Scroll.to(HARDWARE_SECTION),
                ScrollMove.by(-150),
                ScrollMove.by(-150),
                WaitUntil.the(HARDWARE_SECTION, isClickable())
                        .forNoMoreThan(15).seconds(),
                Click.on(HARDWARE_SECTION),
                WaitFor.seconds(7),
                ScrollThroughArticles.slowly()
        );
    }
}

