/// <reference types="cypress" />

const CatalogueClass = require('./catalogue');

class Description extends CatalogueClass {
    constructor() {
        super();
        this.backToProducts = () => cy.get('[data-test="back-to-products"]');
        this.addToCartDescription = () => cy.get('[data-test="add-to-cart"]');
        this.removeDescription = () => cy.get('[data-test="remove"]');
    }

    verifyLogin() {
        // console.log('Verificando si el usuario está logueado:', this.isLoggedIn);
        if (!this.isLoggedIn) {
            throw new Error('Debes iniciar sesión primero usando la función login() heredada de Login.');
        }
    }

    clickAddToCartDescription() {
        this.verifyLogin();
        this.addToCartDescription().should('exist').then(($addToCart) => {
            if ($addToCart.is(':visible')) {
                this.addToCartDescription().click();
            } else {
                cy.log('Ya existe el producto en el carro de compras')
            }
        });
    }
    clickRemoveDescription() {
        this.verifyLogin();
        this.removeDescription().should('exist').then(($remove) => {
            if ($remove.is(':visible')) {
                this.removeDescription.click();
            } else {
                cy.log('No se puede remover porque no existe el producto en el carro de compras')
            }
        });
    }
}


module.exports = Description;