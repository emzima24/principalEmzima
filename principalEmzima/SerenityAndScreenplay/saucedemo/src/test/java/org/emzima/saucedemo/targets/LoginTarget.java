package org.emzima.saucedemo.targets;

import net.serenitybdd.screenplay.targets.Target;

public class LoginTarget {
    public static final Target USERNAME_INPUT =
            Target.the("Input username")
            .locatedBy("#user-name");
    public static final Target PASSWORD_INPUT =
            Target.the("Input password")
                    .locatedBy("#password");
    public static final Target LOGIN_BUTTON =
            Target.the("Login button")
                    .locatedBy("#login-button");
}

