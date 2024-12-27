/// <reference types="cypress" />

const CheckoutComplete = require('../pages/checkoutComplete');

function obtenerAtributoProducto(productos, nombreProducto, atributo) {
  if (productos[nombreProducto]) {
    console.log(productos[nombreProducto][atributo]);
    return productos[nombreProducto][atributo];
  } else {
    throw new Error(`Producto ${nombreProducto} no encontrado`);
  };
};

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
  it('should manage the app from login to logout', () => {
    compl.login(credentials.username, credentials.password);
    compl.clickCart();
    compl.clickResetAppState();
    compl.clickContinueShoping();
    addId = obtenerAtributoProducto(productos, 'Test.allTheThings() T-Shirt (Red)', 'id_add_cart');
    compl.clickAddToCart(addId);
    compl.clickCart();
    compl.clickCheckout();
    compl.continuePayment('Carlos', 'Alonso', 'C1429SAV'); 
    compl.clickFinishOverview();
    compl.clickBackHome();
    compl.clickLogout();
    cy.get('#login-button').should('be.visible');
  });
});