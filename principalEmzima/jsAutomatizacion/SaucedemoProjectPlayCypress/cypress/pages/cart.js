/// <reference types="cypress" />

const descriptionClass = require('./description');

class Cart extends descriptionClass  {
    constructor() {
        super();
        this.continueShopping = () => cy.get('[data-test="continue-shopping"]');
        this.checkout = () => cy.get('[data-test="checkout"]');
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