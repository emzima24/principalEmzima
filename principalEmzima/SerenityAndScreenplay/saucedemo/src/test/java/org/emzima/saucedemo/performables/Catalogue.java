package org.emzima.saucedemo.performables;

import net.serenitybdd.screenplay.Performable;
import org.emzima.saucedemo.utils.SelectRandomProducts;
public class Catalogue {
    public static Performable loadOneProductIntoCart() {
        return SelectRandomProducts.fromJson(1,1);
    }
    public static Performable loadTwoProductsIntoCart() {
        return SelectRandomProducts.fromJson(2,2);
    }
    public static Performable loadThreeProductsIntoCart() {
        return SelectRandomProducts.fromJson(3,3);
    }
    public static Performable loadFourProductsIntoCart() {
        return SelectRandomProducts.fromJson(4,4);
    }
    public static Performable loadFiveProductsIntoCart() {
        return SelectRandomProducts.fromJson(5,5);
    }
    public static Performable loadSixProductsIntoCart() {
        return SelectRandomProducts.fromJson(6,6);
    }
    public static Performable loadAnyQuantityProductsIntoCart() {
        return SelectRandomProducts.fromJson();
    }
}
