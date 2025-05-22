import {Given,When,And, Then} from "cypress-cucumber-preprocessor/steps";

Given('I navigate to the home page', () => {
    cy.ProductPage.goWeblink();

});

When('I select the {string} category', (category) => {
    cy.ProductPage.categoryClick(category);
});


And('I click on a random product by the cards', () => {
    cy.ProductPage.randomSelectionProductCardByImgClick();
});

Then('I should be taken to the product page', () => {
    cy.ProductPage.productNameChoice.then(expectedName => {
        const PRODUCT_DATA = cy.ProductPage.getProductDataFromFixtures(expectedName);
        cy.ProductPage.getProductName().should('eq', expectedName);
        cy.ProductPage.getProductPrice().should('contain', PRODUCT_DATA.price);
        cy.ProductPage.getProductDescription().should('eq', PRODUCT_DATA.description);
    });
});

When('I select a random category', () => {
    cy.ProductPage.categoryClick();
});

And('I click a random product by link', () => {
    cy.ProductPage.randomSelectionProductCardByLinkClick();
});

And('I search and click on {string}', (productName) => {
    cy.ProductPage.selectionProductCardByNameClick(productName);
});
