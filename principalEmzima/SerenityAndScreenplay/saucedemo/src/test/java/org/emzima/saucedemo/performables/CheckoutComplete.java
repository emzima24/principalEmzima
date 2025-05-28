package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Question;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.questions.Text;

import org.emzima.saucedemo.tasks.ClickExecutions;

import static org.emzima.saucedemo.targets.CheckoutCompleteTarget.*;
public class CheckoutComplete {
    public static Question<String> getTitle() {
        return Text.of(TITLE_COMPLETE)
                .describedAs("The title of the page");
    }

    public static Question<String> getMessageComplete() {
        return Text.of(MESSAGE_COMPLETE)
                .describedAs("The thank you message");
    }
    public static Performable clickBackHomeButton() {

        return Task.where(
                "{3} Click on the back home button",
                ClickExecutions.buttonByLocator("Back home button", BACK_HOME_BUTTON)
        );
    }
}
