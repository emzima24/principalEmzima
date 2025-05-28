package org.emzima.saucedemo.targets;

import net.serenitybdd.screenplay.targets.Target;

public class CheckoutCompleteTarget {
    public static final Target TITLE_COMPLETE =
            Target.the("Title completed")
                    .locatedBy("//span[@data-test='title']");
    public static final Target MESSAGE_COMPLETE =
            Target.the("Message on complete page")
                    .locatedBy("//h2[@data-test='complete-header']");
    public static final Target BACK_HOME_BUTTON =
            Target.the("Back home button")
                    .locatedBy("#back-to-products");
}
