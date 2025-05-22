describe('Pruebas en la pagina despues de logueado', () => {
    beforeEach(() => {
        cy.HomeSuccessPage.goWeblink();
        cy.HomeSuccessPage.practiceClick();
        cy.HomeSuccessPage.loginClick();
        cy.HomeSuccessPage.typeUserInput(cy.HomeSuccessPage.userValid);
        cy.HomeSuccessPage.typePassInput(cy.HomeSuccessPage.passValid);
        cy.HomeSuccessPage.submitClick();
    });

    it('Test #1, comprobamos subtitulo ', () => {
        cy.HomeSuccessPage.getSubtitle()
            .should('be.visible')
            .should('contain', cy.HomeSuccessPage.subtitleSuccessExpected);
    });
    it('Test #2, comprobamos subtexto ', () => {
        cy.HomeSuccessPage.getSubtextDiv()
            .should('be.visible')
            .should('contain', cy.HomeSuccessPage.subtextExpected);
    });
    it('Test #3, deslogueamos y verificamos la pagina de llegada', () => {
        cy.HomeSuccessPage.loggoutClick()
        cy.HomeSuccessPage.getTitleLoginPage()
            .should('be.visible')
            .should('have.text', cy.HomeSuccessPage.subtitleLoginExpected);
    });
});