package org.emzima.wikipedia;

import net.serenitybdd.annotations.Managed;
import net.serenitybdd.screenplay.abilities.BrowseTheWeb;
import org.emzima.wikipedia.*;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;

import net.serenitybdd.annotations.WithTag;
import net.serenitybdd.junit5.SerenityJUnit5Extension;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.ensure.Ensure;
import org.openqa.selenium.WebDriver;

@WithTag("Search")
@ExtendWith(SerenityJUnit5Extension.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class SeleniumWikipediaSearchStoryTest {


    /*@CastMember(name = "Steve")
    Actor steve;*/
    @Managed
    WebDriver hisBrowser;

    Actor steve;

    @BeforeEach
    void prepare() {
        steve = Actor.named("Steve");
        steve.can(BrowseTheWeb.with(hisBrowser));
    }

    @WithTag("Selenium")
    @Test
    @Order(1)
    public void searchForSeleniumArticles() {
        steve.attemptsTo(
                Navigate.toWikipediaHome(),
                Search.byKeyword("Selenium software"),
                Ensure.thatTheListOf(SearchResults.results()).hasSizeGreaterThan(3)
        );
    }


    @WithTag("WikipediaArticle")
    @Test
    @Order(2)
    public void verifyFirstSeleniumArticleContent() {
        steve.attemptsTo(
                Navigate.toWikipediaHome(),
                Search.byKeyword("Selenium software"),
                Select.firstResult(),
                Ensure.that(Article.content()).textContent().contains("Selenium")
        );
    }
}
