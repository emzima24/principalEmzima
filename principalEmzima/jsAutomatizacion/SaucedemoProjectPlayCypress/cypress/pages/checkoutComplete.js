/// <reference types="cypress" />

const CheckoutOverviewClass = require('./checkoutOverview');

class CheckoutComplete extends CheckoutOverviewClass {
    constructor() {
        super();
    }

    clickBackHome() {
        this.clickBackToProducts();
    }
}

module.exports = CheckoutComplete;