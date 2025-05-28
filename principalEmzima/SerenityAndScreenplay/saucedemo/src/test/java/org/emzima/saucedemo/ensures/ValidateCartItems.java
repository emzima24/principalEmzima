package org.emzima.saucedemo.ensures;

import net.serenitybdd.core.Serenity;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.abilities.BrowseTheWeb;
import net.serenitybdd.screenplay.ensure.Ensure;
import net.serenitybdd.screenplay.questions.Text;

import static org.emzima.saucedemo.targets.CartTarget.SHOPPING_CART_BADGE;
import static org.emzima.saucedemo.targets.CartTarget.CART_ITEMS;


public class ValidateCartItems implements Task {
    public static ValidateCartItems quantity() {
        return Tasks.instrumented(ValidateCartItems.class);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {

        int actualItems =
                BrowseTheWeb.as(actor).findAll(CART_ITEMS).size();

        if (actualItems == 0) {
            actor.attemptsTo(
                    Ensure.that(SHOPPING_CART_BADGE).isNotDisplayed()
            );
        } else {
            actor.attemptsTo(
                    Ensure.that(Text.of(SHOPPING_CART_BADGE))
                            .isEqualTo(String.valueOf(actualItems))
            );
            Serenity.recordReportData()
                    .withTitle("Number of products left in the cart")
                    .andContents(String.valueOf(actualItems));
        }
    }
}
