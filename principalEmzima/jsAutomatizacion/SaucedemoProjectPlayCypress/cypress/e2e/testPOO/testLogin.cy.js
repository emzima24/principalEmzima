/// <reference types="cypress" />

const Login = require('../../pages/login');

describe('test', () => {
  let credentials;
  const log = new Login();
  before(() => {
    cy.fixture('Users/standardUser').then((creds) => {
      credentials = creds;
    });
  });
  it('should log into the app', () => {
    log.login(credentials.username, credentials.password);
    cy.wrap(log).its('isLoggedIn').should('be.true');
  });
}); 