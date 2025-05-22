package org.emzima;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;


import net.serenitybdd.junit5.SerenityJUnit5Extension;
/*import net.thucydides.core.annotations.Steps;
import net.thucydides.core.annotations.WithTag;
import net.thucydides.core.annotations.WithTags;*/
import net.serenitybdd.annotations.Steps;
import net.serenitybdd.annotations.Narrative;
import net.serenitybdd.annotations.WithTag;
import net.serenitybdd.annotations.WithTags;

@Narrative(text = {"This is a sample Serenity BDD test."})
@WithTags({@WithTag("regression")})
@ExtendWith(SerenityJUnit5Extension.class)
public class SerenityTest {
    @Steps
    SampleSteps sampleSteps;


    @Test
    public void verifySerenityBDDSetup() {
        sampleSteps.performSomeAction(5, 2);
        sampleSteps.verifyResult(7);
    }
}
