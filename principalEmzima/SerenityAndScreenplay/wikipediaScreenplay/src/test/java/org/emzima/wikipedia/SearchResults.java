package org.emzima.wikipedia;

import net.serenitybdd.screenplay.targets.Target;

public class SearchResults {
    public static Target results() {
        return Target.the("search results")
                .locatedBy(".mw-search-results li");
    }
}
/*
 * Nota: Otra implementación posible usando ElementsLocated directamente:
 * Aunque es funcional, no se recomienda porque no sigue el enfoque más
 * expresivo y legible de Screenplay con `Target`.
 *
 * public class SearchResults {
 * public static Target results() {
 * return ElementLocated.by(".mw-search-results li");
 * }
 * }
 */