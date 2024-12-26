/// <reference types="cypress" />

const CartClass = require('./cart');

class CheckoutInformation extends CartClass {
    constructor() {
        super();
        this.firstName = () => cy.get('[data-test="firstName"]');
        this.lastName = () => cy.get('[data-test="lastName"]');
        this.postalCode = () => cy.get('[data-test="postalCode"]');
        this.continueButton = () => cy.get('[data-test="continue"]');
        this.cancelButton = () => cy.get('[name="cancel"]');
        
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

    clickContinueButton() {
        this.verifyLogin();
        this.continueButton().click()
        }
    
    clickCancelButton() {
        this.verifyLogin();
        this.cancelButton().click()
    }

    continuePayment(nameFirst, nameLast, code) {
        this.typeFirstName(nameFirst);
        this.typeLastName(nameLast);
        this.typePostalCode(code);
        this.clickContinueButton()
    }
}

module.exports = CheckoutInformation;