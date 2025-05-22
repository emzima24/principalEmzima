import {Given,When,Then} from "cypress-cucumber-preprocessor/steps";

Given('I navigate to the home page', () => {
  cy.HomePage.goWeblink();
});

Then('I should see a product in the carousel', () => {
  cy.HomePage.getActiveCarouselImage()
    .should('contain', cy.HomePage.imagenPhoneExpected);
});

When('I click the {string} button on the carousel', (direction) => {
  const FN = direction === 'next' ?
    cy.HomePage.carouselControlNextClick :
    cy.HomePage.carouselControlPrevClick;

  cy.HomePage.carouselAndWaitclick(FN);
});

Then('I should see the expected {string} product', (direction) => {
  const IMAGEN_EXPECTED = direction === 'next' ?
    cy.HomePage.imagenPhoneNexusExpected :
    cy.HomePage.imagenNotebookExpected;

  cy.HomePage.getActiveCarouselImage()
    .should('not.be.empty')
    .and('eq', IMAGEN_EXPECTED);
});

When('I click the {string} button three times in the carousel', (direction) => {
  const FN = direction === 'next' ?
    cy.HomePage.carouselControlNextClick :
    cy.HomePage.carouselControlPrevClick;
  cy.HomePage.getActiveCarouselImage().then(initialSrc => {
    cy.HomePage.aliasAsignmentGlobal(initialSrc, 'firstProduct')
  });
  [...Array(3)].forEach(() => cy.HomePage.carouselAndWaitclick(FN));
});

Then('I should see the first product', () => {
  cy.HomePage.getAlias('firstProduct').then((firstSrc) => {
    cy.HomePage.getActiveCarouselImage()
      .should('eq', firstSrc);
  });

});