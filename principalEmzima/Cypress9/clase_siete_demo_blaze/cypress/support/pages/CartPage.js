import ProductPage from './ProductPage';


class CartPage extends ProductPage {
    getProductName() {
        return cy.get(Cypress.env('pageLocators').productNameCart, {
                timeout: 7000
            })
            .invoke('text')
            .then(text => text.trim());
    }
    getProductPrice() {
        return cy.get(Cypress.env('pageLocators').productPriceCart, {
                timeout: 7000
            })
            .invoke('text')
            .then(text => text.trim());
    }
    getProductRowByName(name) {
        return cy.get(Cypress.env('pageLocators').productRow).filter(`:contains(${name})`);
    }
    getPriceCellFromRow(row) {
        return cy.wrap(row).find('td').eq(2);
    }

    //     get headerArray() {
    //         return data.elementHeaderArray;
    //     }
    //     get contactTitleExpected() {
    //         return data.contactTitleText;
    //     }
    //     get aboutUsTitleExpected() {
    //         return data.aboutUsTitleText;
    //     }
    //     get logInTitleExpected() {
    //         return data.logInTitleText;
    //     }
    //     get signUpTitleExpected() {
    //         return data.signUpTitleText;
    //     }
    //     get nameContact() {
    //         return data.contactName;
    //     }
    //     get nameAboutUs() {
    //         return data.aboutUsName;
    //     }
    //     get nameLogIn() {
    //         return data.logInName;
    //     }
    //     get nameSignUp() {
    //         return data.signUpName;
    //     }
    //     get complementSel() {
    //         return data.otherExceptAboutUs;
    //     }

    //     getNavegationBar() {
    //         return cy.get(data.navegationBarSelText + ' a.nav-link');
    //     }
    //     getNavItemByIndex(index) {
    //         return cy.get(pageLocators.elementHeaderSel(index));
    //     }
    //     getTitleModal(name) {
    //         return cy.get(pageLocators.titleModal(name));
    //     }

    //     buttonCloseModalClick(name, other) {
    //         return cy.get(pageLocators.buttonCloseModal(name, other))
    //             .click();
    //     }
    //     buttonCloseXsupModalClick(name) {
    //         return cy.get(pageLocators.buttonCloseXsupModal(name))
    //             .click();
    //     }
    //     navegationBarClick(element) {
    //         return this.getNavegationBar()
    //             .contains(element)
    //             .click();
    //     }

    //     validateAllHeaderButtonsVisible() {
    //         this.headerArray.forEach((text) => {
    //             this.getNavegationBar().contains(text).should('be.visible');
    //         });
    //     }

    //     waitExplicit(time) {
    //         cy.wait(time);
    //     }

    //     waitForModalShown(name) {
    //         return cy.window().then({
    //             timeout: 10000
    //         }, (win) => {
    //             return new Cypress.Promise((resolve) => {
    //                 const $MODAL = win.$(pageLocators.modalHidden(name));
    //                 if ($MODAL.hasClass('show') && !$MODAL.data('_isTransitioning')) {
    //                     resolve();
    //                 } else {
    //                     $MODAL.on('shown.bs.modal', () => resolve());
    //                 }
    //             });
    //         });
    //     }

    //     waitForModalHidden(name) {
    //         return cy.window().then({
    //             timeout: 10000
    //         }, (win) => {
    //             return new Cypress.Promise((resolve) => {
    //                 const $MODAL = win.$(pageLocators.modalHidden(name));
    //                 if (!$MODAL.hasClass('show')) {
    //                     resolve();
    //                 } else {
    //                     $MODAL.on('hidden.bs.modal', () => resolve());
    //                 }
    //             });
    //         });
    //     }
}
export default CartPage;