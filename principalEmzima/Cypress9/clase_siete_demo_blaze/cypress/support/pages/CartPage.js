import ProductPage from './ProductPage';


class CartPage extends ProductPage {

    get namePurchaseExpected() {
        return Cypress.env('expectedData').nameText;
    }

    get countryPurchaseExpected() {
        return Cypress.env('expectedData').countryText;
    }
    get cityPurchaseExpected() {
        return Cypress.env('expectedData').cityText;
    }

    get creditCardPurchaseExpected() {
        return Cypress.env('expectedData').creditCardText;
    }
    get monthPurchaseExpected() {
        return Cypress.env('expectedData').monthText;
    }

    get yearPurchaseExpected() {
        return Cypress.env('expectedData').yearText;
    }

    getProductName() {
        return cy.get(Cypress.env('pageLocators').productNameCartSel, {
                timeout: 7000
            })
            .invoke('text')
            .then(text => text.trim());
    }
    getProductPrice() {
        return cy.get(Cypress.env('pageLocators').productPriceCartSel, {
                timeout: 7000
            })
            .invoke('text')
            .then(text => text.trim());
    }
    getProductRowByName(name) {
        return cy.contains(Cypress.env('pageLocators').productRowSel, name, {
                timeout: 10000
            })
            .parent('tr')
    }
    getPriceCellFromRow(row) {
        return cy.wrap(row).find('td').eq(2);
    }
    placeHolderButtonClick() {
        return cy.get(Cypress.env('pageLocators').placeHolderButtonSel)
            .click();
    }
    purchaseButtonClick() {
        return cy.get(Cypress.env('expectedData').purchaseText)
            .click();
    }
    typeNameInput(name = this.namePurchaseExpected) {
        return cy.typeSlowly(Cypress.env('pageLocators').placeHolderInputNameId,name);
    }
    typeCountryInput(country = this.countryPurchaseExpected) {
        return cy.typeSlowly(Cypress.env('pageLocators').placeHolderInputCountryId,country);
    }
    typeCityInput(city = this.cityPurchaseExpected) {
        return cy.typeSlowly(Cypress.env('pageLocators').placeHolderInputCityId,city);
    }
    typeCreditCardInput(creditCard = this.creditCardPurchaseExpected) {
        return cy.typeSlowly(Cypress.env('pageLocators').placeHolderInputCreditCardId,creditCard);
    }
    typeMonthInput(month = this.monthPurchaseExpected) {
        return cy.typeSlowly(Cypress.env('pageLocators').placeHolderInputMonthId,month);
    }
    typeYearInput(year = this.yearPurchaseExpected) {
        return cy.type(Cypress.env('pageLocators').placeHolderInputYearId,year);
    }
}
export default CartPage;