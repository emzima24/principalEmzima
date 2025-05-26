package org.emzima.technewsworld.targets;

import net.serenitybdd.screenplay.targets.Target;

public class HardwareArticleTarget {
    public static Target ARTICLES = Target.the("artículos completos")
            .locatedBy("//div[contains(@class,'search-item') and not(contains(@class,'article-ad-row'))]");

    public static Target TITLES = Target.the("títulos")
            .locatedBy("//div[contains(@class,'search-item') and not(contains(@class,'article-ad-row'))]//h2");

    public static Target DATES = Target.the("fechas")
            .locatedBy("//div[contains(@class,'search-item') and not(contains(@class,'article-ad-row'))]//li[contains(@class,'story-meta')]");

    public static Target IMAGES = Target.the("imágenes")
            .locatedBy("//div[contains(@class,'search-item')]//img");
}
