import HeaderPage from './HeaderPage';

class ProductPage extends HeaderPage {

    get productNameChoice() {
        return cy.get('@selectedProductName');
    }
    get urlCartExpected() {
        return Cypress.env('expectedData').urlCartText;
    }

    getProductDataFromFixtures(productName) {
        const ALL_PRODUCTS = [
            ...Cypress.env('laptopsData'),
            ...Cypress.env('monitorsData'),
            ...Cypress.env('phonesData')
        ];
        return ALL_PRODUCTS.find(product => product.name === productName);
    }
    getProductName() {
        return cy.get(Cypress.env('pageLocators').productNameSel)
            .invoke('text')
            .then(text => text.trim());
    }
    getProductDescription() {
        return cy.get(Cypress.env('pageLocators').productDescriptionSel)
            .invoke('text')
            .then(text => text.trim());
    }
    getProductPrice() {
        return cy.get(Cypress.env('pageLocators').productPriceSel)
            .invoke('text')
            .then(text => text.trim());
    }
    getMessageAlert(callback) {
        cy.getAlertMessage(callback);
    }
    getAddedProductNames() {
        return Cypress.env('addedProductNames') || [];
    }
    

    addToCartProductClick() {
        return cy.contains(Cypress.env('expectedData').addToCartText)
            .click();
    }
    addToCartRandomDistinctProducts(min, max) {
        return cy.addRandomDistinctProducts(min, max)
    }
}
export default ProductPage;