package org.emzima.technewsworld.targets;

import net.serenitybdd.screenplay.targets.Target;


public class HardwareTarget {
    public static final Target TECHNEWSWORLD_CHANNELS =
            Target.the("Technewsworld Channels section")
                    .locatedBy("//h2[contains(text(),'Technewsworld Channels')]");
    public static final Target HARDWARE_SECTION =
            Target.the("Hardware section link")
                    .locatedBy("//div[h2[contains(text(),'Technewsworld Channels')]]//a[h4[contains(text(),'Hardware')]]");
}

