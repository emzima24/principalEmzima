/// <reference types="cypress" />

const CartClass = require('./cart');

class CheckoutInformation extends CartClass {
    constructor() {
        super();
        this.firstName = () => cy.get('[data-test="firstName"]');
        this.lastName = () => cy.get('[data-test="lastName"]');
        this.postalCode = () => cy.get('[data-test="postalCode"]');
        this.continueInformation = () => cy.get('[data-test="continue"]');
        this.cancelInformation = () => cy.get('[data-test="cancel"]');
        
    }

    typeFirstName(nameFirst) {
        this.verifyLogin();
        this.firstName().type(nameFirst);
    }

    typeLastName(nameLast) {
        this.verifyLogin();
        this.lastName().type(nameLast);
    }

    typePostalCode(code) {
        this.verifyLogin();
        this.postalCode().type(code);
    }

    clickContinueInformation() {
        this.verifyLogin();
        this.continueInformation().click()
        }
    
    clickCancelInformation() {
        this.verifyLogin();
        this.cancelInformation().click()
    }

    continuePayment(nameFirst, nameLast, code) {
        this.typeFirstName(nameFirst);
        this.typeLastName(nameLast);
        this.typePostalCode(code);
        this.clickContinueInformation()
    }
}

module.exports = CheckoutInformation;