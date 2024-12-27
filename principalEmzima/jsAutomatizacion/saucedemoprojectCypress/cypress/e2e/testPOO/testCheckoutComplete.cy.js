/// <reference types="cypress" />

const CheckoutComplete = require('../../pages/checkoutComplete');

describe('test', () => {
  const compl = new CheckoutComplete();
  let credentials;
  let productos;
  let addId;

  before(() => {
    cy.fixture('Users/standardUser').then((creds) => {
      credentials = creds;
    });
    cy.fixture('Products/productos').then((data) => {
      productos = data;
    });
  });
  it('should manage the checkout complete page and back home in app', () => {
    compl.login(credentials.username, credentials.password);
    compl.clickCart();
    compl.clickResetAppState();
    compl.clickContinueShoping();
    addId = compl.obtenerAtributoProducto(productos, 'Sauce Labs Bike Light', 'id_add_cart');
    compl.clickAddToCart(addId);
    compl.clickCart();
    compl.clickCheckout();
    compl.continuePayment('Carlos', 'Alonso', 'C1429SAV'); 
    compl.clickFinishOverview();
    compl.clickBackHome();
    cy.get('[data-test="title"]').should('be.visible').and('contain','Products');
  });
});
