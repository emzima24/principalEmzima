package org.emzima.saucedemo.targets;

import net.serenitybdd.screenplay.targets.Target;

public class InventoryTarget {
    public static final Target BURGUER_MENU =
            Target.the("hamburger menu")
                    .locatedBy("#react-burger-menu-btn");
    public static final Target MENU_SIDEBAR =
            Target.the("menu sidebar")
                    .locatedBy("#bm-menu-wrap");
    public static final Target LOGOUT_LINK =
            Target.the("logout sidebar link")
                    .locatedBy("#logout_sidebar_link");
}
