package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;

import org.emzima.saucedemo.tasks.ClickExecutions;
import org.emzima.saucedemo.utils.WaitFor;

import static org.emzima.saucedemo.targets.InventoryTarget.*;
public class Logout {
    public static Performable openBurgerMenu() {

        return Task.where(
                "{1} Open hamburger menu",
                WaitFor.seconds(4),
                ClickExecutions.buttonByLocator("Menu button", BURGUER_MENU)
        );
    }
    public static Performable selectLogoutOption() {

        return Task.where(
                "{2} Select logout option",
                WaitFor.seconds(4),
                ClickExecutions.buttonByLocator("Logout link", LOGOUT_LINK)
        );
    }
    public static Performable performLogout() {

        return Task.where(
                "{3} Perform complete logout",
                openBurgerMenu(),
                selectLogoutOption()
        );
    }
}
