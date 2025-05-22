import HomePage from './HomePage';

class HeaderPage extends HomePage {

    get headerArray() {
        return Cypress.env('expectedData').elementHeaderArray;
    }
    get contactTitleExpected() {
        return Cypress.env('expectedData').contactTitleText;
    }
    get aboutUsTitleExpected() {
        return Cypress.env('expectedData').aboutUsTitleText;
    }
    get logInTitleExpected() {
        return Cypress.env('expectedData').logInTitleText;
    }
    get signUpTitleExpected() {
        return Cypress.env('expectedData').signUpTitleText;
    }
    get nameContact() {
        return Cypress.env('expectedData').contactName;
    }
    get nameAboutUs() {
        return Cypress.env('expectedData').aboutUsName;
    }
    get nameLogIn() {
        return Cypress.env('expectedData').logInName;
    }
    get nameSignUp() {
        return Cypress.env('expectedData').signUpName;
    }

    getNavegationBar() {
        return cy.get(Cypress.env('pageLocators').navegationBarSelText);
    }

    getTitleModal(name) {
        return cy.getModalTitle(name);
    }

    navegationBarClick(element) {
        return this.getNavegationBar()
            .contains(element)
            .click();
    }

    closeModalClick (name) {
        return cy.closeModal(name)
    }

    validateAllHeaderButtonsVisible() {
        this.headerArray.forEach((text) => {
            this.getNavegationBar()
                .contains(text)
                .should('be.visible');
        });
    }

    waitExplicit(time) {
        cy.wait(time);
    }

    waitForModalShown(name) {
        return cy.waitForModal(name);
    }

    waitForModalHidden(name) {
        return cy.waitForModal(name, "hide");
    }
}
export default HeaderPage;