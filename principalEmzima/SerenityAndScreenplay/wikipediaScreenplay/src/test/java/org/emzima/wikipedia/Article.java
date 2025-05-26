package org.emzima.wikipedia;

import net.serenitybdd.screenplay.targets.Target;


public class Article {
    public static Target content() {
        return Target.the("article content")
                .locatedBy("#mw-content-text");
    }
}


/*
 * Nota: Otra implementación posible usando ElementsLocated directamente:
 * Aunque es funcional, no se recomienda porque no sigue el enfoque más
 * expresivo y legible de Screenplay con `Target`.
 *
 * public static Target content() {
 * return ElementsLocated.by("#mw-content-text");
 * }
 */