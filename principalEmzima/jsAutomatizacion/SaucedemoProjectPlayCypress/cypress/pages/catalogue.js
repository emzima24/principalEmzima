/// <reference types="cypress" />

import LoginClass from './login';

class Catalogue extends LoginClass {
    constructor() {
        super();
        this.hambugerMenu = () => cy.get('#react-burger-menu-btn',{timeout:3000});
        this.cart = () => cy.get('.shopping_cart_link');
        this.allItems = () => cy.get('#inventory_sidebar_link');
        this.logout = () => cy.get('#logout_sidebar_link');
        this.resetAppState = () => cy.get('#reset_sidebar_link');
    }

    verifyLogin() {
        // console.log('Verificando si el usuario está logueado:', this.isLoggedIn);
        if (!this.isLoggedIn) {
            throw new Error('Debes iniciar sesión primero usando la función login() heredada de Login.');
        }
    }

    clickHambugerMenu() {
        this.verifyLogin();
        this.hambugerMenu().click({ force: true });
    }

    clickLogout() {
        this.verifyLogin();
        this.clickHambugerMenu();
        cy.get('.bm-menu-wrap').should('be.visible').then(() => {
            this.logout().should('be.visible').click({ force: true });
            this.isLoggedIn = false;
        });
    }

    clickResetAppState() {
        this.verifyLogin();
        this.clickHambugerMenu();
        cy.get('.bm-menu-wrap').should('be.visible').then(() => {
            this.resetAppState().should('be.visible').click({ force: true });
        });
    }

    clickAllItems() {
        this.verifyLogin();
        this.clickHambugerMenu();
        cy.get('.bm-menu-wrap').should('be.visible').then(() => {
            this.allItems().should('be.visible').click({ force: true });
        });
    }

    clickCart() {
        this.verifyLogin();
        this.cart().click();
    }

    clickAddToCart(product) {
        this.verifyLogin();
        this.clickCart();
        this.resetAppState();
        this.clickAllItems();
        cy.get(`[data-test="${product}"]`).click();
    }

    clickTitle(product) {
        this.verifyLogin();
        cy.get(`[data-test="${product}"] > [data-test="inventory-item-name"]`).should('be.visible').click();
    }
}

module.exports = Catalogue;