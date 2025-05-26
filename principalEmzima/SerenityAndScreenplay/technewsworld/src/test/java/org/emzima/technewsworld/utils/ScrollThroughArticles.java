package org.emzima.technewsworld.utils;


import net.serenitybdd.screenplay.Performable;
import net.serenitybdd.screenplay.Task;

import java.util.ArrayList;
import java.util.List;

public class ScrollThroughArticles {

    public static Performable slowly() {
        List<Performable> steps = new ArrayList<>();

        for (int i = 0; i < 7; i++) {
            steps.add(ScrollMove.by(500));
            steps.add(WaitFor.seconds(2));
        }

        return Task.where(
                "{0} scroll in steps to load articles and images",
                steps.toArray(new Performable[0])
        );
    }
}

