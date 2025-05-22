import {Given,When,Then} from "cypress-cucumber-preprocessor/steps";

Given('I am on the home page', () => {
  cy.HeaderPage.goWeblink();
});

Then('I should see the following buttons in the header: {string}', () => {
  cy.HeaderPage.validateAllHeaderButtonsVisible();
});

Given('I am on a {string} page', (typePage) => {
  const TYPE = typePage === 'product details' ?
    cy.HeaderPage.randomSelectionProductCardByImgClick() :
    cy.HeaderPage.navegationBarClick(typePage);
});

When('I click on the {string} link in the header', (linkText) => {
    cy.HeaderPage.navegationBarClick(linkText);
});

Then('I should be redirected to the home page', () => {
  cy.HeaderPage.urlResponse()
    .should('include', Cypress.config().baseUrl);
});

Then('I should see the {string} modal', (modalName) => {
  let name, complement, valueExpected;
  if (modalName === 'Contact') {
    name = cy.HeaderPage.nameContact;
    valueExpected = cy.HeaderPage.contactTitleExpected;
  } else if (modalName === 'About us') {
    name = cy.HeaderPage.nameAboutUs;
    valueExpected = cy.HeaderPage.aboutUsTitleExpected;
  } else if (modalName === 'Log in') {
    name = cy.HeaderPage.nameLogIn;
    valueExpected = cy.HeaderPage.logInTitleExpected;
  } else { //(modalName === 'Sign up')
    name = cy.HeaderPage.nameSignUp;
    valueExpected = cy.HeaderPage.signUpTitleExpected;
  }
  cy.HeaderPage.waitForModalShown(name);
  cy.HeaderPage.getTitleModal(name)
    .should('have.text', valueExpected);
  cy.HeaderPage.closeModalClick(name,'header');
  // cy.HeaderPage.closeModalClick(name); //footer por defecto
  cy.HeaderPage.waitForModalHidden(name);
});