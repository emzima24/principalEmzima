describe('Pruebas en la pagina login', () => {
    beforeEach(() => {
        cy.LoginPage.goWeblink();
        cy.LoginPage.practiceClick();
    });



    it('Test #1, comprobamos el subtitulo pagina intermedia', () => {
        cy.LoginPage.getSubtitle()
            .should('be.visible')
            .should('contain', cy.LoginPage.subtitleIntermediateExpected);
    });

    it('Test #2, comprobamos que esta el link de las excepciones ', () => {
        cy.LoginPage.getExceptionsLink()
            .should('be.visible')
            .should('contain.text', cy.LoginPage.testExceptionsTextExpected);
    });

    it('Test #3, comprobamos que esta el link de las practicas ', () => {
        cy.LoginPage.getLoginLink()
            .should('be.visible')
            .should('contain.text', cy.LoginPage.testLoginTextExpected);
    });

    it('Test #4, hacemos clic en test login y comprobamos el subtitulo pagina Login', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.getTitleLoginPage()
            .should('have.text', cy.LoginPage.subtitleLoginExpected);
    });

    it('Test #5, comprobamos username NO valido (vacio) y password valido (vacio)', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.submitClick();
        cy.LoginPage.getMsgError()
            .should('have.text', cy.LoginPage.msgUserErrorExpected);
    });

    it('Test #6, comprobamos username valido y password valido ', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.typeUserInput(cy.LoginPage.userValid);
        cy.LoginPage.typePassInput(cy.LoginPage.passValid);
        cy.LoginPage.submitClick();
        cy.LoginPage.urlResponse()
            .should('include', cy.LoginPage.urlSuccessExpected);
    });

    it('Test #7, comprobamos username valido y password NO valido (mas corto) ', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.typeUserInput(cy.LoginPage.userValid);
        cy.LoginPage.typePassInput(cy.LoginPage.passValid.slice(0, 4));
        cy.LoginPage.submitClick();
        cy.LoginPage.getMsgError()
            .should('have.text', cy.LoginPage.msgPassErrorExpected);
    });
    it('Test #8, comprobamos username NO valido (valido pero en mayusculas) y password valido ', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.typeUserInput(cy.LoginPage.userValid.toUpperCase());
        cy.LoginPage.typePassInput(cy.LoginPage.passValid);
        cy.LoginPage.submitClick();
        cy.LoginPage.getMsgError()
            .should('have.text', cy.LoginPage.msgUserErrorExpected);
    });

    it('Test #9, comprobamos username valido  y password NO valido (valido pero en minusculas)', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.typeUserInput(cy.LoginPage.userValid);
        cy.LoginPage.typePassInput(cy.LoginPage.passValid.toLowerCase());
        cy.LoginPage.submitClick();
        cy.LoginPage.getMsgError()
            .should('have.text', cy.LoginPage.msgPassErrorExpected);
    });

    it('Test #10, comprobamos username valido  y password NO valido (igual a username)', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.typeUserInput(cy.LoginPage.userValid);
        cy.LoginPage.typePassInput(cy.LoginPage.userValid);
        cy.LoginPage.submitClick();
        cy.LoginPage.getMsgError()
            .should('have.text', cy.LoginPage.msgPassErrorExpected);
    });

    it('Test #11, comprobamos username NO valido (igual a password) y password valido', () => {
        cy.LoginPage.loginClick();
        cy.LoginPage.typeUserInput(cy.LoginPage.passValid);
        cy.LoginPage.typePassInput(cy.LoginPage.passValid);
        cy.LoginPage.submitClick();
        cy.LoginPage.getMsgError()
            .should('have.text', cy.LoginPage.msgUserErrorExpected);
    });
});