// ***********************************************************
// This example support/index.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands'

// Alternatively you can use CommonJS syntax:
// require('./commands')
import CartPage from './pages/CartPage';
import ProductPage from './pages/ProductPage';
import HeaderPage from './pages/HeaderPage';
import HomePage from './pages/HomePage';

let laptopsData, monitorsData, phonesData, pageLocators, expectedData;

before(() => {

});

beforeEach(() => {
  cy.HomePage = new HomePage();
  cy.HeaderPage = new HeaderPage();
  cy.ProductPage = new ProductPage();
  cy.CartPage = new CartPage();
  cy.fixture('locators').then(data => Cypress.env('pageLocators', data));
  cy.fixture('expected').then(data => Cypress.env('expectedData', data));
  cy.fixture('laptops').then(data => Cypress.env('laptopsData', data));
  cy.fixture('monitors').then(data => Cypress.env('monitorsData', data));
  cy.fixture('phones').then(data => Cypress.env('phonesData', data));
});

Cypress.on('uncaught:exception', (err, runnable) => {
  if (err.message.includes('Bootstrap\'s JavaScript requires jQuery')) {
    return false;
  }
});