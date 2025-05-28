package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;

import org.emzima.saucedemo.tasks.ClickExecutions;
import org.emzima.saucedemo.tasks.EnterIntoTheField;
import utils.ValueReadingManager;

import java.util.Objects;

import static org.emzima.saucedemo.targets.LoginTarget.*;
public class Login {
    public static Performable typeUsername() {

        return Task.where(
                "{1} Write username",
                EnterIntoTheField.byLocator(
                        Objects.requireNonNull(
                                ValueReadingManager.getInstance()
                        ).getUsername("prod"),
                        USERNAME_INPUT)
        );
    }
    public static Performable typePassword() {

        return Task.where(
                "{2} Write password",
                EnterIntoTheField.byLocator(
                        Objects.requireNonNull(
                                ValueReadingManager.getInstance()
                        ).getPassword("prod"),
                        PASSWORD_INPUT)
        );
    }
    public static Performable clickLoginButton() {

        return Task.where(
                "{3} Click on the login button",
                ClickExecutions.buttonByLocator("Login button",LOGIN_BUTTON)
        );
    }
    public static Performable withCredentials() {

        return Task.where(
                "{1} Enter username, password and click in Login button in one step with valid credentials",
                typeUsername(),
                typePassword(),
                clickLoginButton()
        );
    }
}
