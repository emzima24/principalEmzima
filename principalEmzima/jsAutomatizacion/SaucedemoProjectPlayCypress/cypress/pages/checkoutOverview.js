/// <reference types="cypress" />

const CheckoutInformationClass = require('./checkoutInformation');

class CheckoutOverview extends CheckoutInformationClass {
    constructor() {
        super();
        this.finish = () => cy.get('[data-test="finish"]');
    }

    clickFinishOverview() {
        this.verifyLogin();
        this.finish().click()
    }

    clickCancelOverview() {
        this.clickCancelInformation();
    }
}

module.exports = CheckoutOverview;