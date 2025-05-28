package org.emzima.saucedemo.targets;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.screenplay.targets.Target;


public class CartTarget {
    public static final Target CART_ICON =
            Target.the("Shopping cart icon")
                    .locatedBy("#shopping_cart_container a");
    public static final Target CHECKOUT_BUTTON =
            Target.the("Checkout button")
                    .locatedBy("#checkout");
    public static final Target CONTINUE_SHOPPING_BUTTON =
            Target.the("Back continue shopping")
                    .locatedBy("#continue-shopping");

    public static final Target CART_ITEMS =
            Target.the("cart items")
                    .located(By.xpath("//div[@data-test='inventory-item']"));

    public static final Target ITEM_TITLE =
            Target.the("item title")
                    .locatedBy(".//div[@data-test='inventory-item-name']");

    public static final Target ITEM_QUANTITY =
            Target.the("item quantity")
                    .locatedBy(".//div[@data-test='item-quantity']");

    public static final Target ITEM_PRICE =
            Target.the("item price")
                    .locatedBy(".//div[@data-test='inventory-item-price']");

    public static final Target REMOVE_BUTTON =
            Target.the("remove button")
                    .locatedBy(".//button[starts-with(@data-test,'remove-')]");

    public static final Target SHOPPING_CART_BADGE =
            Target.the("shopping cart badge")
                    .locatedBy("//span[@data-test='shopping-cart-badge']");

}

