describe('Pruebas en la pagina Principal', () => {
    beforeEach(() => {
        cy.HomePage.goWeblink();
    });

    it('Test #1, el sutitulo', () => {
        cy.HomePage.getSubtitle()
            .should('contain', cy.HomePage.subtitleHomeExpected);
    });
    it('Test #2, el texto alternativo del logo', () => {
        cy.HomePage.getLogo()
            .should('have.attr', 'alt', cy.HomePage.logoAltExpected);
    });

    it('Test #3, , el texto alternativo de la imagen', () => {
        cy.HomePage.getImagen()
            .should('have.attr', 'alt', cy.HomePage.imgAltExpected);
    });

    it('Test #4, el link del blog', () => {
        cy.HomePage.getBlogLink()
            .should('be.visible')
            .should('contain.text', cy.HomePage.linkBlogExpected);
    });

    it('Test #5, el link de cursos', () => {
        cy.HomePage.getCoursesLink()
            .should('be.visible')
            .should('contain.text', cy.HomePage.linkCoursesExpected);
    });
    it('Test #6, el link de las practicas', () => {
        cy.HomePage.getPracticeLink()
            .should('be.visible')
            .should('contain.text', cy.HomePage.linkPracticeExpected);
    });
});