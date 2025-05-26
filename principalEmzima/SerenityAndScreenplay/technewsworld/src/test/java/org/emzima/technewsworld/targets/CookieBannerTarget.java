package org.emzima.technewsworld.targets;

import net.serenitybdd.screenplay.targets.Target;


public class CookieBannerTarget {
    public static final Target COOKIE_BANNER = Target.the("Banner de cookies")
            .locatedBy("#hs-eu-cookie-confirmation");

    public static final Target ACCEPT_COOKIES_BUTTON = Target.the("Botón Aceptar Cookies")
            .locatedBy("#hs-eu-confirmation-button");
}

