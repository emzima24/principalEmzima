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
import 'cypress-xpath'

// Alternatively you can use CommonJS syntax:
// require('./commands')
import HomePage from './pages/HomePage';
import BlogPage from './pages/BlogPage.js';
import LoginPage from './pages/LoginPage.js';
import ExceptionsPage from './pages/ExceptionsPage';
import HomeSuccessPage from './pages/HomeSuccessPage';


// Hazlas disponibles globalmente (opcional)
beforeEach(() => {
  cy.HomePage = new HomePage();
  cy.LoginPage = new LoginPage();
  cy.HomeSuccessPage = new HomeSuccessPage();
  cy.BlogPage = new BlogPage();
  cy.ExceptionsPage = new ExceptionsPage();
});