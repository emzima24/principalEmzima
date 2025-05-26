package org.emzima.wikipedia;

import net.serenitybdd.annotations.Managed;
import net.serenitybdd.junit5.SerenityJUnit5Extension;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.abilities.BrowseTheWeb;
import net.serenitybdd.screenplay.actions.Open;
import net.serenitybdd.screenplay.ensure.Ensure;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.openqa.selenium.WebDriver;

@ExtendWith(SerenityJUnit5Extension.class)
public class MinimalWikipediaTest {

    @Managed
    WebDriver browser;

    Actor steve;

    @BeforeEach
    void setUp() {
        steve = Actor.named("Steve");
        steve.can(BrowseTheWeb.with(browser));
    }

    @Test
    void shouldOpenWikipediaHomePage() {
        steve.attemptsTo(
                Open.url("https://www.wikipedia.org"),
                Ensure.thatTheCurrentPage().title().contains("Wikipedia")
        );
    }
}
