package org.emzima.technewsworld.targets;

import net.serenitybdd.screenplay.targets.Target;


public class PopUpTarget {
    public static final Target POPUP_CLOSE_BUTTON =
            Target.the("Botón cerrar publicidad")
            .locatedBy("button.pum-close.popmake-close");
}

