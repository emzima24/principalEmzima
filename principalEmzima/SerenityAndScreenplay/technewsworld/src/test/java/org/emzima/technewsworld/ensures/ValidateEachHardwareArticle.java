package org.emzima.technewsworld.ensures;

import net.serenitybdd.core.pages.ListOfWebElementFacades;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.ensure.Ensure;

import static org.emzima.technewsworld.targets.HardwareArticleTarget.*;
import static org.emzima.technewsworld.targets.HardwareArticleTarget.IMAGES;

public class ValidateEachHardwareArticle implements Task {

    public static ValidateEachHardwareArticle hasTitleDateAndImage() {
        return Tasks.instrumented(ValidateEachHardwareArticle.class);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {

        ListOfWebElementFacades articles = ARTICLES.resolveAllFor(actor);
        ListOfWebElementFacades titles = TITLES.resolveAllFor(actor);
        ListOfWebElementFacades dates = DATES.resolveAllFor(actor);
        ListOfWebElementFacades images = IMAGES.resolveAllFor(actor);

        actor.attemptsTo(
                Ensure.that(articles.size()).isGreaterThanOrEqualTo(5),

                Ensure.that(titles.size()).isEqualTo(articles.size()),

                Ensure.that(dates.size()).isGreaterThanOrEqualTo(articles.size()),

                Ensure.that(images.size()).isEqualTo(articles.size())
        );

    }
}