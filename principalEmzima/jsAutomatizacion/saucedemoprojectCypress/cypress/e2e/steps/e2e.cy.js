/// <reference types="cypress" />

const CheckoutComplete = require('../../pages/checkoutComplete');
const { Given, When, Then } = require('cypress-cucumber-preprocessor/steps');

const compl = new CheckoutComplete();
let addId;
let credentials;
let productos;
before(() => {
    cy.fixture('Users/standardUser').then((creds) => {
      credentials = creds;
    });
    cy.fixture('Products/productos').then((data) => {
      productos = data;
    });
  });

Given('I go to the website as a registered user', () => {
    compl.openUrl()
}),
    When('I enter the username and password', () => {
        compl.typeUserName(credentials.username);
        compl.typePassword(credentials.password);
    }),
    When('I click on Login button', () => {
        compl.clickLoginButton();
    }),
    When(`I click on the Add to cart button for the {string}`, (product) => {
        compl.clickCart();
        compl.clickResetAppState();
        compl.clickContinueShoping();
        addId = compl.obtenerAtributoProducto(productos, product, 'id_add_cart');
        compl.clickAddToCart(addId);
    }),
    When('I click on the cart icon', () => {
        compl.clickCart();
    }),
    When('I click on the Checkout button', () => {
        compl.clickCheckout();
    }),
    When(`I filled the field for the first_name with {string}`, (first_name) => {
        compl.typeFirstName(first_name);
    }),
    When(`I filled the field for the last_name with {string}`, (last_name) => {
        compl.typeLastName(last_name);
    }),
    When(`I filled the field for the zip_code with {string}`, (zip_code) => {
        compl.typePostalCode(zip_code);
    }),
    When('I click on the Continue button', () => {
        compl.clickContinueInformation();
    }),
    When('I click on the Finish button', () => {
        compl.clickFinishOverview();
    }),
    When('I click on the Back Home button', () => {
        compl.clickBackHome();
    }),
    When('I display the hamburger menu', () => {
        compl.clickHambugerMenu();
        compl.clickHambugerMenu();
    }),
    When('I log out', () => {
        compl.clickLogout();
    }),
    Then('I want to go to the login page', () => {
        cy.get('#login-button').should('be.visible');
    })
