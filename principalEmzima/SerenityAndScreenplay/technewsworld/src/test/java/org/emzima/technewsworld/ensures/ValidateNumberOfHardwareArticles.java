package org.emzima.technewsworld.ensures;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.ensure.Ensure;

import static org.emzima.technewsworld.targets.HardwareArticleTarget.*;


public class ValidateNumberOfHardwareArticles implements Task {
    @Override
    public <T extends Actor> void performAs(T actor) {
        int articleCount = ARTICLES.resolveAllFor(actor).size();

        actor.attemptsTo(
                Ensure.that(articleCount).isGreaterThanOrEqualTo(5)
        );
    }

    public static ValidateNumberOfHardwareArticles atLeastFive() {
        return Tasks.instrumented(ValidateNumberOfHardwareArticles.class);
    }
}
