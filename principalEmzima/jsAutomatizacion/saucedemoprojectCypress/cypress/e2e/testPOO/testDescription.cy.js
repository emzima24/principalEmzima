/// <reference types="cypress" />

const Description = require('../../pages/description');

describe('test', () => {
  const desc = new Description();
  let credentials;
  let productos;
  let addXpathImage;
  let addXpathTitle;

  before(() => {
    cy.fixture('Users/standardUser').then((creds) => {
      credentials = creds;
    });
    cy.fixture('Products/productos').then((data) => {
      productos = data;
    });
  });
  it('should manage the description page in app and log out', () => {
    desc.login(credentials.username, credentials.password);
    addXpathTitle = desc.obtenerAtributoProducto(productos, 'Sauce Labs Backpack', 'xpath_title');
    desc.clickTitle(addXpathTitle);
    desc.clickAddToCartDescription();
    desc.clickCart();
    desc.clickAllItems();
    desc.clickLogout({ force: true });
    cy.get('#login-button').should('be.visible');
  });

  it('should manage the description page in app', () => {
    desc.login(credentials.username, credentials.password);
    desc.clickCart();
    desc.clickResetAppState();
    desc.clickAllItems();
    addXpathImage = desc.obtenerAtributoProducto(productos, 'Sauce Labs Oneise', 'xpath_image');
    desc.clickImage(addXpathImage);
    desc.clickAddToCartDescription();
    desc.clickCart();
    cy.get('#checkout').should('be.visible');
  });
});
