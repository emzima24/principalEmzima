/// <reference types="cypress" />

const Description = require('../../pages/description');

function obtenerAtributoProducto(productos, nombreProducto, atributo) {
  if (productos[nombreProducto]) {
    console.log(productos[nombreProducto][atributo]);
    return productos[nombreProducto][atributo];
  } else {
    throw new Error(`Producto ${nombreProducto} no encontrado`);
  };
};

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
    addXpathTitle = obtenerAtributoProducto(productos, 'Sauce Labs Backpack', 'xpath_title');
    desc.clickTitle(addXpathTitle);
    // console.log(addXpathTitle);
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
    addXpathImage = obtenerAtributoProducto(productos, 'Sauce Labs Oneise', 'xpath_image');
    desc.clickImage(addXpathImage);
    desc.clickAddToCartDescription();
    desc.clickCart();
    cy.get('#checkout').should('be.visible');
  });
});
