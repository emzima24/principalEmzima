package org.emzima.saucedemo.utils;

import net.serenitybdd.core.Serenity;
import net.serenitybdd.core.pages.ListOfWebElementFacades;
import net.serenitybdd.screenplay.*;
import net.serenitybdd.screenplay.targets.Target;
import net.serenitybdd.screenplay.waits.WaitUntil;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isVisible;

import static org.emzima.saucedemo.targets.CartTarget.*;

import org.emzima.saucedemo.tasks.ClickExecutions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.*;
import java.util.stream.Collectors;

public class RemoveItemsFromCart implements Task {
    private enum Mode {BY_NAME, FIRST_N, LAST_N, MIDDLE, ALL}

    private final Mode mode;
    private final String name;
    private final int count;

    private static final String REMOVED_KEY = "removedProducts";

    private RemoveItemsFromCart(Mode mode, String name, int count) {
        this.mode = mode;
        this.name = name;
        this.count = count;
    }

    public static RemoveItemsFromCart byName(String productName) {
        return new RemoveItemsFromCart(Mode.BY_NAME, productName, 0);
    }

    public static RemoveItemsFromCart first(int n) {
        return new RemoveItemsFromCart(Mode.FIRST_N, null, n);
    }

    public static RemoveItemsFromCart last(int n) {
        return new RemoveItemsFromCart(Mode.LAST_N, null, n);
    }

    public static RemoveItemsFromCart middle() {
        return new RemoveItemsFromCart(Mode.MIDDLE, null, 0);
    }

    public static RemoveItemsFromCart all() {
        return new RemoveItemsFromCart(Mode.ALL, null, 0);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        actor.attemptsTo(
                WaitUntil.the(CART_ITEMS, isVisible()).forNoMoreThan(10).seconds()
        );

        ListOfWebElementFacades rows = CART_ITEMS.resolveAllFor(actor);

        List<Row> list = rows.stream().map(Row::new).collect(Collectors.toList());

        List<Row> rowsToRemove;

        switch (mode) {
            case BY_NAME:
                rowsToRemove = list.stream()
                        .filter(r -> r.title.equalsIgnoreCase(name))
                        .collect(Collectors.toList());
                if (rowsToRemove.isEmpty()) {
                    Serenity.recordReportData()
                            .withTitle("Item not found")
                            .andContents("The product '" + name + "' was not present in the cart.");
                    return;
                }
                break;

            case FIRST_N:
                rowsToRemove = list.stream()
                        .limit(count)
                        .collect(Collectors.toList());
                break;

            case LAST_N:
                rowsToRemove = list.stream()
                        .skip(Math.max(0, list.size() - count))
                        .collect(Collectors.toList());
                break;

            case MIDDLE:
                if (list.size() < 3) {
                    rowsToRemove = Collections.emptyList();
                } else {
                    rowsToRemove = List.of(list.get(list.size() / 2));
                }
                break;

            case ALL:
            default:
                rowsToRemove = list;
        }
        List<String> removed = new ArrayList<>();
        for (Row r : rowsToRemove) {
            Target removeBtn = Target.the("Remove " + r.title)
                    .located(By.id(r.removeButtonId));
            actor.attemptsTo(
                    ClickExecutions.buttonByLocator("Remove " + r.title, removeBtn)
            );
            removed.add(r.title);
        }
    }

    private static class Row {
        final String title;
        final String removeButtonId;

        Row(WebElement element) {
            this.title = element.findElement(By.xpath(".//div[@data-test='inventory-item-name']"))
                    .getText();
            this.removeButtonId = element.findElement(By.xpath(".//button[contains(@data-test,'remove-')]"))
                    .getAttribute("id");
        }
    }
}