package org.emzima.saucedemo.targets;

import net.serenitybdd.screenplay.targets.Target;

public class CheckoutInformationTarget {
    public static final Target FIRST_NAME = Target.the("First name field")
            .locatedBy("#first-name");

    public static final Target LAST_NAME = Target.the("Last name field")
            .locatedBy("#last-name");
    public static final Target POSTAL_CODE = Target.the("Zip/Postal code field")
            .locatedBy("#postal-code");
    public static final Target CONTINUE_BUTTON =
            Target.the("Continue button")
                    .locatedBy("#continue");
    public static final Target CANCEL_BUTTON =
            Target.the("Back cancel button")
                    .locatedBy("#cancel");
}

