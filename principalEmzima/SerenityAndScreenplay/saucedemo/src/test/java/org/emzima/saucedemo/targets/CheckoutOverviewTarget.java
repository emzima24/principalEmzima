package org.emzima.saucedemo.targets;

import net.serenitybdd.screenplay.targets.Target;

public class CheckoutOverviewTarget {
    public static final Target FINISH_BUTTON =
            Target.the("Finish button")
                    .locatedBy("#finish");
    public static final Target CANCEL_BUTTON =
            Target.the("Cancel button back to catalogue")
                    .locatedBy("#cancel");
}
