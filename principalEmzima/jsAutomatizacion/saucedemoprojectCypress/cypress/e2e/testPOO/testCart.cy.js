/// <reference types="cypress" />

const Cart = require('../../pages/cart');

describe('test', () => {
  const cart = new Cart();
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
  it('should manage the description page and logout in app', () => {
    cart.login(credentials.username, credentials.password);
    cart.clickCart();
    cart.clickResetAppState();
    cart.clickContinueShoping();
    addId = cart.obtenerAtributoProducto(productos, 'Sauce Labs Fleece Jacket', 'id_add_cart');
    cart.clickAddToCart(addId);
    cart.clickCart();
    cart.clickLogout({ force: true });
    cy.get('#login-button').should('be.visible');
  });

  it('should manage the description page and checkout button in app', () => {
    cart.login(credentials.username, credentials.password);
    cart.clickCart();
    cart.clickResetAppState();
    cart.clickContinueShoping();
    addId = cart.obtenerAtributoProducto(productos, 'Sauce Labs Bolt T-Shirt', 'id_add_cart');
    cart.clickAddToCart(addId);
    cart.clickCart();
    cart.clickCheckout();
    cy.get('[data-test="title"]').should('be.visible').and('contain','Checkout: Your Information');
  });
});
