class HomePage {

    get imagenPhoneExpected() {
        return Cypress.env('expectedData').imagenPhonFile;
    }
    get imagenNotebookExpected() {
        return Cypress.env('expectedData').imagenNotebookFile;
    }
    get imagenPhoneNexusExpected() {
        return Cypress.env('expectedData').imagenPhon2File;
    }
    get homeButtonExpected() {
        return Cypress.env('expectedData').homeButtonText;
    }
    get cartButtonExpected() {
        return Cypress.env('expectedData').cartButtonText;
    }
    get contactButtonExpected() {
        return Cypress.env('expectedData').contactButtonText;
    }
    get aboutUsButtonExpected() {
        return Cypress.env('expectedData').aboutUsButtonText;
    }
    get logInButtonExpected() {
        return Cypress.env('expectedData').logInButtonText;
    }
    get signUpButtonExpected() {
        return Cypress.env('expectedData').signUpButtonText;
    }
    get navegationBarSel() {
        return Cypress.env('expectedData').navegationBarSelText;
    }
    get subtitleHomeExpected() {
        return Cypress.env('expectedData').subtitleHomeText;
    }


    urlResponse() {
        return cy.url();
    }
    goWeblink() {
        return cy.visit('/');
    }

    getElementsCarousel() {
        return cy.get(Cypress.env('pageLocators').firstCarouselProductNameClass);
    }
    getSubtitleHome() {
        return cy.get(Cypress.env('pageLocators').subtitleHomeId)
    }

    getActiveCarouselImage() {
        return cy.get(Cypress.env('pageLocators').itemActiveCarouselSel)
            .invoke('attr', 'src');;
    }
    getAlias(alias) {
        return cy.get(`@${alias}`)
    }
    getWaitForCarouselReady() {
        return cy.get(Cypress.env('pageLocators').carouselSlideSel, {
                timeout: 10000
            })
            .should('be.visible');
    }

    carouselControlPrevClick = () => {
        return cy.get(Cypress.env('pageLocators').carouselControlPrevClass)
            .click();
    }
    carouselControlNextClick = () => {
        return cy.get(Cypress.env('pageLocators').carouselControlNextClass)
            .click();
    }
    categoryClick(categoryText) {
        cy.elementCategoryClick(categoryText);
    }

    randomSelectionProductCardByImgClick() {
        return cy.clickRandomProductByImage();
    }
    selectionProductCardByNameClick(name) {
        return cy.clickProductCardByName(name);
    }
    randomSelectionProductCardByLinkClick() {
        return cy.clickRandomProductCardByLink();
    }
    carouselAndWaitclick(funct) {
        cy.clickCarouselAndWait(funct)
    }

    aliasAsignmentGlobal(element, alias) {
        return cy.wrap(element).as(alias)
    }
}
export default HomePage;