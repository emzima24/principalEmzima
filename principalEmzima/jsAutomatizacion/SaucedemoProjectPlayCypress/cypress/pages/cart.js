/// <reference types="cypress" />

const descriptionClass = require('./description');

class Cart extends descriptionClass  {
    constructor() {
        super();
        this.continueShopping = () => cy.get('[data-test="continue-shopping"]');
        this.checkout = () => cy.get('[data-test="checkout"]');
    }

    verifyLogin() {
        // console.log('Verificando si el usuario está logueado:', this.isLoggedIn);
        if (!this.isLoggedIn) {
            throw new Error('Debes iniciar sesión primero usando la función login() heredada de Login.');
        }
    }

    clickCheckout() {
        this.verifyLogin();
        this.checkout().click({force:true});
    }
    clickContinueShoping() {
        this.verifyLogin();
        this.continueShopping().click({force:true});
    }
}


module.exports = Cart;