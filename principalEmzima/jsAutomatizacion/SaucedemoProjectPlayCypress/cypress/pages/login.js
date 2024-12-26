/// <reference types="cypress" />

class Login {
    constructor() {
        this.goTo = () => cy.visit('/');
        this.username = () => cy.get('#user-name');
        this.password = () => cy.get('#password');
        this.loginButton = () => cy.get('#login-button');
        this.isLoggedIn = false;
    }

    openUrl() {
        this.goTo();
    }

    typeUserName(nameUser) {
        this.username().type(nameUser);
    }

    typePassword(pass) {
        this.password().type(pass);
    }

    clickLoginButton() {
        this.isLoggedIn = true;
        this.loginButton().click().then(() => {
            cy.get('[data-test="social-twitter"]', { timeout: 0 }).then($twitter => {
                if ($twitter.is(':visible')) {
                    this.isLoggedIn = true;
                } else {
                    this.isLoggedIn = false;
                }
            });
        });
    }

    login(nameUser, pass) {
        this.openUrl();
        this.typeUserName(nameUser);
        this.typePassword(pass);
        this.clickLoginButton();
    }
}

module.exports = Login;