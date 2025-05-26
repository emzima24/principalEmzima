package org.emzima.technewsworld.utils;


import net.serenitybdd.screenplay.Question;
import net.serenitybdd.screenplay.targets.Target;

public class IsElementPresent {
    public static Question<Boolean> forTarget(Target target) {
        return actor -> target.resolveFor(actor).isPresent();
    }
}
