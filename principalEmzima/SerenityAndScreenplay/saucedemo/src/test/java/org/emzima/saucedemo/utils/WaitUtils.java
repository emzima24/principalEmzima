package org.emzima.saucedemo.utils;

import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;

public class WaitUtils {
    public static Performable pauseForMilliseconds(long millis) {
        return Task.where("{0} waits for " + millis + "ms", actor -> {
            try {
                Thread.sleep(millis);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
    }
}
