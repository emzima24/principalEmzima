/// <reference types="cypress" />

const {Given, When, Then} = require('@badeball/cypress-cucumber-preprocessor');

const url = 'https://google.com'
Given('I open Google page', () => {
  cy.visit(url);
}),
  When('I write in the search bar {string}', (search) => {
    cy.get('#APjFqb').type(search);
  }),
  Then(`I see {string} in the title`, (title) => {
    cy.title().should('include', title);
  })



