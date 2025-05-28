package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;

import org.emzima.saucedemo.tasks.ClickExecutions;
import org.emzima.saucedemo.utils.*;

import static org.emzima.saucedemo.targets.CartTarget.*;
public class Cart {
    public static Performable goToCart() {
        return Task.where(
                "{1} Access the cart",
                ClickExecutions.buttonByLocator("Cart icon", CART_ICON)
        );
    }

    public static Performable goToContinueCheckout() {
        return Task.where(
                "{1} Continue checkout",
                ClickExecutions.buttonByLocator("Checkout button", CHECKOUT_BUTTON)
        );
    }

    public static Performable goToContinueShopping() {
        return Task.where(
                "{1} Continue shpopping back",
                ClickExecutions.buttonByLocator("Continue shpopping button", CONTINUE_SHOPPING_BUTTON)
        );
    }

    public static Performable removeByName(String name) {
        return Task.where(RemoveItemsFromCart.byName(name)
        );
    }

    public static Performable removeFirst() {
        return Task.where(RemoveItemsFromCart.first(1)
        );
    }

    public static Performable removeLast() {
        return Task.where(RemoveItemsFromCart.last(1)
        );
    }

    public static Performable removeMiddle() {
        return Task.where(RemoveItemsFromCart.middle()
        );
    }

    public static Performable removeAll() {
        return Task.where(RemoveItemsFromCart.all()
        );
    }
}

