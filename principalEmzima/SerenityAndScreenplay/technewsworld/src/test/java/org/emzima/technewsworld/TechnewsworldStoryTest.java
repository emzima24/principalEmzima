package org.emzima.technewsworld;

import net.serenitybdd.screenplay.ensure.Ensure;
import net.serenitybdd.annotations.Managed;
import net.serenitybdd.screenplay.abilities.BrowseTheWeb;
import net.serenitybdd.annotations.WithTag;
import net.serenitybdd.junit5.SerenityJUnit5Extension;
import net.serenitybdd.screenplay.Actor;
import org.emzima.technewsworld.ensures.ValidateNumberOfHardwareArticles;
import org.emzima.technewsworld.performables.Navigate;
import org.emzima.technewsworld.performables.SelectHardwareSection;
import org.emzima.technewsworld.utils.SearchResults;

import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.openqa.selenium.WebDriver;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isPresent;
import static net.serenitybdd.screenplay.waits.WaitUntil.the;

import static org.emzima.technewsworld.targets.HardwareArticleTarget.ARTICLES;

@WithTag("Pop Up, Cookies banner, scroll, list, search contains")
@ExtendWith(SerenityJUnit5Extension.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TechnewsworldStoryTest {

    @Managed
    WebDriver hisBrowser;

    Actor testlinkLovers;

    @BeforeEach
    void prepare() {
        hisBrowser.manage().window().maximize();
        testlinkLovers = Actor.named("Testlink_Lovers");
        testlinkLovers.can(BrowseTheWeb.with(hisBrowser));
    }

    @WithTag("Hardware quantity articles")
    @Test
    @Order(1)
    public void searchForHardwareSectionQuantityArticles() {

        testlinkLovers.attemptsTo(
                Navigate.toTechnewsworldHome(),
                SelectHardwareSection.fromMainMenu(),
                ValidateNumberOfHardwareArticles.atLeastFive(),
                the(ARTICLES, isPresent()).forNoMoreThan(10).seconds(),
                Ensure.thatTheListOf(ARTICLES).hasSizeGreaterThanOrEqualTo(5),
                Ensure.that(SearchResults.containsImages(testlinkLovers, "AMD", "AMD's","AMD`s")).isLessThanOrEqualTo(2L)
//                Ensure.that(SearchResults.containsData(testlinkLovers, "March", "Mar")).isEqualTo(5L)
//                Ensure.that(SearchResults.containsTitle(testlinkLovers)).isEqualTo(2L),
                );
    }

    @Disabled("Temporarily ignored until case #1 is resolved")
    @WithTag("containsAMDtitle")
    @Test
    @Order(2)
    public void searchForHardwareSectionTitleContainsAMDCount() {
        testlinkLovers.attemptsTo(
                Navigate.toTechnewsworldHome(),
                SelectHardwareSection.fromMainMenu()
//                Ensure.that(SearchResults.containsTitle(testlinkLovers)).isEqualTo(2L)
        );
    }
    @Disabled("Temporarily ignored until case #1 is resolved")
    @WithTag("containsMarchDate")
    @Test
    @Order(3)
    public void searchForHardwareSectionDateContainsMarchCount() {
        testlinkLovers.attemptsTo(
                Navigate.toTechnewsworldHome(),
                SelectHardwareSection.fromMainMenu()
//                Ensure.that(SearchResults.containsData(testlinkLovers)).isEqualTo(5L)
        );
    }
    @Disabled("Temporarily ignored until case #1 is resolved")
    @WithTag("containsAMDaltImages")
    @Test
    @Order(4)
    public void searchForHardwareSectionAltImageContainsAMDCount() {
        testlinkLovers.attemptsTo(
                Navigate.toTechnewsworldHome(),
                SelectHardwareSection.fromMainMenu()
//                Ensure.that(SearchResults.containsImages(testlinkLovers)).isEqualTo(2L)
        );
    }

}
