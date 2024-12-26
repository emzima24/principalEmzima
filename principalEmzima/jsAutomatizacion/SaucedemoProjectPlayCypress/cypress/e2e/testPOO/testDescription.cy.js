/// <reference types="cypress" />

const Catalogue = require('../../pages/catalogue');

function obtenerAtributoProducto(productos, nombreProducto, atributo) {
  if (productos[nombreProducto]) {
    console.log(productos[nombreProducto][atributo]);
    return productos[nombreProducto][atributo];
  } else {
    throw new Error(`Producto ${nombreProducto} no encontrado`);
  };
};

describe('test', () => {
  const cat = new Catalogue();
  let credentials;
  let productos;
  let addId;
  let addXpathTitle;

  before(() => {
    cy.fixture('Users/standardUser').then((creds) => {
      credentials = creds;
    });
    cy.fixture('Products/productos').then((data) => {
      productos = data;
    });
  });
  it('should manage the catalogue in the app', () => {
    cat.login(credentials.username, credentials.password);
    addXpathTitle = obtenerAtributoProducto(productos, 'Sauce Labs Backpack', 'xpath_title');
    cat.clickTitle(addXpathTitle);
    // console.log(addXpathTitle);
    cat.clickCart();
    cat.clickAllItems();
    cat.clickLogout({ force: true });
    cy.get('#login-button').should('be.visible');
  });

  it('should manage the catalogue with a product in the app', () => {
    cat.login(credentials.username, credentials.password);
    cat.clickCart();
    cat.clickResetAppState();
    cat.clickAllItems();
    addId = obtenerAtributoProducto(productos, 'Sauce Labs Oneise', 'id_add_cart');
    // console.log(addId);
    cat.clickAddToCart(addId);
    cat.clickCart();
    cy.get('#checkout').should('be.visible');
  });
});
