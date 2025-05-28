package org.emzima.saucedemo.utils;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

import net.serenitybdd.core.Serenity;
import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.actions.Scroll;
import net.serenitybdd.screenplay.targets.Target;
import net.serenitybdd.screenplay.waits.WaitUntil;

import org.emzima.saucedemo.tasks.ClickExecutions;
import utils.ValueReadingManager;

import java.lang.reflect.Type;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.Collections;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isClickable;

import static org.emzima.saucedemo.utils.WaitUtils.pauseForMilliseconds;

public class SelectRandomProducts implements Task {
    private final Map<String, Product> catalog;
    private final int quantity;

    private SelectRandomProducts(Map<String, Product> catalog, int quantity) {
        this.catalog = catalog;
        this.quantity = quantity;
    }

    private static final String PRODUCTS_JSON = Objects.requireNonNull(
            ValueReadingManager.getInstance()
    ).getJsonAllProducts().toString();

    private static class Product {
        @SerializedName("xpath_title")
        String xpathTitle;
        @SerializedName("xpath_image")
        String xpathImage;
        @SerializedName("id_add_cart")
        String idAddCart;
    }

    public static class ProductSelection {
        public final String name;
        public final String id;

        public ProductSelection(String name, String id) {
            this.name = name;
            this.id = id;
        }

        @Override
        public String toString() {
            return name + " (id: " + id + ")";
        }
    }

    public static SelectRandomProducts fromJson() {
        return fromJson(PRODUCTS_JSON,1, 6);
    }
    public static SelectRandomProducts fromJson(int min, int max) {
        return fromJson(PRODUCTS_JSON,min,max);
    }
    public static SelectRandomProducts fromJson(String json,int min, int max) {
        Type type = new TypeToken<Map<String, Product>>() {
        }.getType();
        Map<String, Product> map = new Gson().fromJson(json, type);

        int safeMin = Math.max(1, Math.min(min, max));
        int safeMax = Math.min(map.size(), Math.max(min, max));

        int qty = ThreadLocalRandom.current().nextInt(safeMin, safeMax + 1);

        return new SelectRandomProducts(map, qty);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        System.out.println("actor en performAs: " + System.identityHashCode(actor));
        List<String> productNames = new ArrayList<>(catalog.keySet());
        Collections.shuffle(productNames);
        List<String> selectedNames = productNames.subList(0, quantity);

        List<Performable> actions = new ArrayList<>();
        List<ProductSelection> selectedProducts = new ArrayList<>();

        for (String name : selectedNames) {
            Product p = catalog.get(name);

            Target addBtn = Target.the("Add to cart " + name).located(By.id(p.idAddCart));

            actions.addAll(
                    List.of(
                            Scroll.to(addBtn),
                            WaitUntil.the(addBtn, isClickable()).forNoMoreThan(3).seconds(),
                            ClickExecutions.buttonByLocator(name, addBtn),
                            pauseForMilliseconds(500)
                    )
            );

            selectedProducts.add(new ProductSelection(name, p.idAddCart));
        }
        System.out.println("Selected Items: " + selectedNames);
        Serenity.recordReportData()
                .withTitle("Chosen products")
                .andContents(selectedNames.toString());

        Serenity.setSessionVariable("selectedProducts").to(selectedProducts);

        @SuppressWarnings("unchecked")
        List<SelectRandomProducts.ProductSelection> selected = (List<SelectRandomProducts.ProductSelection>) Serenity.sessionVariableCalled("selectedProducts");

        actor.attemptsTo(actions.toArray(new Performable[0]));
    }

    public static List<ProductSelection> recalledBy(Actor actor) {
        Object remembered = actor.recall("selectedProducts");

        if (remembered == null) {
            System.out.println("The selected products was not found in the actor's memory.");
            return Collections.emptyList();
        }

        if (!(remembered instanceof List)) {
            System.out.println("The selected products is not a list. Actual type: " + remembered.getClass());
            return Collections.emptyList();
        }

        try {
            @SuppressWarnings("unchecked")
            List<ProductSelection> list = (List<ProductSelection>) remembered;
            return list;
        } catch (ClassCastException e) {
            System.out.println("\n" + "Error converting to List<ProductSelection>: " + e.getMessage());
            return Collections.emptyList();
        }
    }


    public static Performable loadProductByNameIntoCart(Collection<String> productNames) {
        return Task.where("{0} loads specific products into cart",
                actor -> {

                    Type type = new TypeToken<Map<String, Product>>(){}.getType();
                    Map<String, Product> catalog = new Gson().fromJson(PRODUCTS_JSON, type);

                    List<Performable> actions = new ArrayList<>();

                    for (String name : productNames) {
                        Product p = catalog.get(name);
                        if (p == null) {
                            System.out.println("\n" + "Product not found in the catalog: " + name);
                            continue;
                        }

                        Target addBtn = Target.the("Add to cart " + name).located(By.id(p.idAddCart));

                        actions.addAll(List.of(
                                Scroll.to(addBtn),
                                WaitUntil.the(addBtn, isClickable()).forNoMoreThan(3).seconds(),
                                ClickExecutions.buttonByLocator(name, addBtn),
                                pauseForMilliseconds(400)
                        ));
                    }

                    actor.attemptsTo(actions.toArray(new Performable[0]));
                }
        );
    }
}
