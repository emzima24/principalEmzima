import {
    Given,
    When,
    Then
} from "cypress-cucumber-preprocessor/steps";

Given('I navigate to the home page', () => {
    cy.CartPage.goWeblink();

});

// When('I select the {string} category', (category) => {
//     cy.CartPage.categoryClick(category);
// });


// When('I click on a random product by the cards', () => {
//     cy.CartPage.randomSelectionProductCardByImgClick();
// });

// Then('I should be taken to the product page', () => {
//     cy.CartPage.productNameChoice.then(expectedName => {
//         const PRODUCT_DATA = cy.CartPage.getProductDataFromFixtures(expectedName);
//         cy.CartPage.getProductName().should('eq', expectedName);
//         cy.CartPage.getProductPrice().should('contain', PRODUCT_DATA.price);
//         cy.CartPage.getProductDescription().should('eq', PRODUCT_DATA.description);
//     });
// });

// When('I select a random category', () => {
//     cy.CartPage.categoryClick();
// });

// When('I click a random product by link', () => {
//     cy.CartPage.randomSelectionProductCardByLinkClick();
// });

When('I search and click on {string}', (productName) => {
    cy.CartPage.selectionProductCardByNameClick(productName);
});

When('I add the product to the cart', () => {
    cy.CartPage.getMessageAlert((alertText) => {
        expect(alertText).to.equal('Product added');
    });

    cy.CartPage.addToCartProductClick();
});

Then('I should see {string} listed in the {string}', (name, page) => {
    const PRODUCT_DATA = cy.CartPage.getProductDataFromFixtures(name);
    cy.CartPage.navegationBarClick(page);
    cy.CartPage.urlResponse()
        .should('include', cy.CartPage.urlCartExpected);
    cy.CartPage.getProductName()
        .should('eq', name);
    cy.CartPage.getProductPrice()
        .should('contain', PRODUCT_DATA.price.replace('$', ''));
});

Given('I have products in my {string}', (page) => {
    cy.CartPage.goWeblink();

    cy.CartPage.addToCartRandomDistinctProducts(2, 2).then(() => {
        const NAMES = cy.CartPage.getAddedProductNames();

        cy.CartPage.navegationBarClick(page);
        cy.wrap(NAMES).each((name) => {
            const EXPECTED = cy.CartPage.getProductDataFromFixtures(name);

            cy.CartPage.getProductRowByName(name).then((row) => {
                cy.CartPage.getPriceCellFromRow(row)
                    .invoke('text')
                    .should('contain', EXPECTED.price.replace('$', ''));
            });
        });
    });
});

When('I proceed to checkout', () => {});

Then('I should be able to complete the purchase', () => {});
/* // Scenario: Add product to cart
Given('I am on a product page', () => {
});



// Scenario: Purchase product from cart



// Scenario: Remove a product from the cart
When('I remove a product', () => {
});

Then('it should no longer appear in the cart', () => {
}); */