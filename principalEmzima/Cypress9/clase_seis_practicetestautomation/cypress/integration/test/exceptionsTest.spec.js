describe('Pruebas en la pagina blog', () => {
    beforeEach(() => {
        cy.ExceptionsPage.goWeblink();
        cy.ExceptionsPage.practiceClick();
        cy.ExceptionsPage.exceptionsClick();
    });


    it('Test #1, comprobamos la pagina de llegada ', () => {
        cy.ExceptionsPage.urlResponse()
            .should('include', cy.ExceptionsPage.urlExceptionsExpected);
    });
    it('Test #2, comprobamos el primer caso (tambien incluye el ultimo caso) planteado en la pagina wait necesario ', () => {
        cy.ExceptionsPage.addButtonClick();
        cy.ExceptionsPage.getInputRow()
            .should('not.have', cy.ExceptionsPage.attrCss, cy.ExceptionsPage.attrStyleExpectedText, 'none');
        cy.ExceptionsPage.getSavedButton()
            .should('be.visible');
        cy.ExceptionsPage.getMsgAdd()
            .should('contain', cy.ExceptionsPage.msgAddExpected);
    });
    it('Test #3, comprobamos el segundo caso planteado en la pagina selector mal escogido', () => {
        cy.ExceptionsPage.addButtonClick();
        cy.ExceptionsPage.getSavedButton()
            .should('be.visible');
        cy.ExceptionsPage.typeInputRow(cy.ExceptionsPage.favoriteFoodValue);
        cy.ExceptionsPage.savedButtonClick();
        cy.ExceptionsPage.getMsgAdd()
            .should('have.text', cy.ExceptionsPage.msgAddSaveExpected);
        cy.ExceptionsPage.getInputRow()
            .should('contain.value', cy.ExceptionsPage.favoriteFoodValue);

    });

    it('Test #4, comprobamos el tercer caso planteado en la pagina input desabilitado', () => {
        cy.ExceptionsPage.getInputField()
            .should('not.be.enabled');
        cy.ExceptionsPage.editButtonClick();
        cy.ExceptionsPage.clearInputField();
        cy.ExceptionsPage.typeInputField(cy.ExceptionsPage.otherFavoriteFoodValue);
        cy.ExceptionsPage.editSavedButtonClick();
        cy.ExceptionsPage.getMsgAdd()
            .should('have.text', cy.ExceptionsPage.msgEditSaveExpected);
        cy.ExceptionsPage.getInputField()
            .should('contain.value', cy.ExceptionsPage.otherFavoriteFoodValue);

    });

    it('Test #5, comprobamos el cuarto caso planteado en la pagina texto habilitado y luego eliminado de la pagina', () => {
        cy.ExceptionsPage.getInstructionsText()
            .should('be.visible')
            .and('have.text', cy.ExceptionsPage.instructionsTextExpected);
        cy.ExceptionsPage.addButtonClick();
        cy.ExceptionsPage.getInstructionsText()
            .should('not.exist');
        cy.ExceptionsPage.searchInstructionsBody();
    });
});