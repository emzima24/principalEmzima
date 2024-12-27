/// <reference types="cypress" />

const CheckoutInformation = require('../../pages/checkoutInformation');

function obtenerAtributoProducto(productos, nombreProducto, atributo) {
  if (productos[nombreProducto]) {
    console.log(productos[nombreProducto][atributo]);
    return productos[nombreProducto][atributo];
  } else {
    throw new Error(`Producto ${nombreProducto} no encontrado`);
  };
};

describe('test', () => {
  const inf = new CheckoutInformation();
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
  it('should manage the checkout information page and cancel in app', () => {
    inf.login(credentials.username, credentials.password);
    inf.clickCart();
    inf.clickResetAppState();
    inf.clickContinueShoping();
    addId = obtenerAtributoProducto(productos, 'Sauce Labs Bike Light', 'id_add_cart');
    inf.clickAddToCart(addId);
    inf.clickCart();
    inf.clickCheckout();
    inf.typeFirstName('Carlos');
    inf.typeLastName('Alonso');
    inf.typePostalCode('C1429SAV');  
    inf.clickCancelInformation();
    cy.get('[data-test="title"]').should('be.visible').and('contain','Your Cart');
  });

  it('should manage the checkout information page and continue in app', () => {
    inf.login(credentials.username, credentials.password);
    inf.clickCart();
    inf.clickResetAppState();
    inf.clickContinueShoping();
    addId = obtenerAtributoProducto(productos, 'Test.allTheThings() T-Shirt (Red)', 'id_add_cart');
    inf.clickAddToCart(addId);
    inf.clickCart();
    inf.clickCheckout();
    inf.continuePayment('Carlos', 'Alonso', 'C1429SAV'); 
    cy.get('[data-test="title"]').should('be.visible').and('have.text','Checkout: Overview');
  });
});
