package org.emzima.technewsworld.utils;

import net.serenitybdd.core.Serenity;
import net.serenitybdd.core.pages.ListOfWebElementFacades;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.questions.Text;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import static org.emzima.technewsworld.targets.HardwareArticleTarget.*;

public class SearchResults {
    public static long containsTitle(Actor actor) {
        Collection<String> titles = Text.ofEach(TITLES)
                .answeredBy(actor);

        return titles.stream()
                .filter(t -> t.contains("AMD") || t.contains("AMD’s"))
                .count();
    }

    public static long containsData(Actor actor, String... monthPatterns) {
        Collection<String> dates = Text.ofEach(DATES)
                .answeredBy(actor)
                .stream()
                .map(String::trim)
                .filter(d -> !d.isEmpty())
                .collect(Collectors.toList());


        System.out.println("Fechas encontradas (" + dates.size() + "):");
        dates.forEach(date -> System.out.println("- " + date));

        return dates.stream()
                .filter(d -> Arrays.stream(monthPatterns)
                        .anyMatch(pattern -> d.contains(pattern))
                )
                .count();
    }

    public static long containsImages(Actor actor, String... keywords) {
        ListOfWebElementFacades images = IMAGES.resolveAllFor(actor);

        System.out.println("✔ Cantidad de imágenes encontradas: " + images.size());
        List<String> matchedAlts = images.stream()
                .map(img -> img.getAttribute("alt"))
                .filter(alt -> alt != null &&
                        Arrays.stream(keywords).anyMatch(kw ->
                                alt.contains(kw) || alt.contains(kw.replace("'", "’"))
                        )
                )
                .map(alt -> alt.replaceAll("\\s+", " ").trim())
                .peek(alt -> System.out.println("✔ ALT que coincide: " + alt))
                .collect(Collectors.toList());
        System.out.println("### ALT REPORT BLOCK:");
        matchedAlts.forEach(System.out::println);

        Serenity.recordReportData()
                .withTitle("Alts que contienen keywords")
                .andContents(String.join("\n", matchedAlts));

        return matchedAlts.size();
    }
}
