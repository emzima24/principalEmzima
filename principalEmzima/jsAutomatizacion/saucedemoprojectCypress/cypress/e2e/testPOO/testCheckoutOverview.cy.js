/// <reference types="cypress" />

const CheckoutOverview = require('../../pages/checkoutOverview');

describe('test', () => {
  const over = new CheckoutOverview();
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
  it('should manage the checkout overview page and cancel in app', () => {
    over.login(credentials.username, credentials.password);
    over.clickCart();
    over.clickResetAppState();
    over.clickContinueShoping();
    addId = over.obtenerAtributoProducto(productos, 'Sauce Labs Bike Light', 'id_add_cart');
    over.clickAddToCart(addId);
    over.clickCart();
    over.clickCheckout();
    over.continuePayment('Carlos', 'Alonso', 'C1429SAV'); 
    over.clickCancelOverview();
    cy.get('[data-test="title"]').should('be.visible').and('contain','Products');
  });

  it('should manage the checkout overview page and finish in app', () => {
    over.login(credentials.username, credentials.password);
    over.clickCart();
    over.clickResetAppState();
    over.clickContinueShoping();
    addId = over.obtenerAtributoProducto(productos, 'Test.allTheThings() T-Shirt (Red)', 'id_add_cart');
    over.clickAddToCart(addId);
    over.clickCart();
    over.clickCheckout();
    over.continuePayment('Carlos', 'Alonso', 'C1429SAV'); 
    over.clickFinishOverview();
    cy.get('[data-test="title"]').should('be.visible').and('have.text','Checkout: Complete!');
  });
});
