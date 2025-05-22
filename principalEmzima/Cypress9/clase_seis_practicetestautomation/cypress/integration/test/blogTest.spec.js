describe('Pruebas en la pagina blog', () => {
    beforeEach(() => {
        cy.BlogPage.goWeblink();
        cy.BlogPage.blogClick();
    });

    it('Test #1, comprobamos la pagina de llegada ', () => {
        cy.BlogPage.urlResponse()
            .should('include', cy.BlogPage.urlBlogExpected);
    });
    it('Test #2, comprobamos el titulo del primer articulo ', () => {
        cy.BlogPage.getTitleArticle()
            .should('be.visible')
            .should('contain', cy.BlogPage.titleArticleTextExpected);
    });
    it('Test #3, comprobamos el titulo el autor del primer articulo ', () => {
        cy.BlogPage.getAutorArticle()
            .should('be.visible')
            .should('contain', cy.BlogPage.autorTextExpected);
    });
    it('Test #4, volvemos a la página Home y comprobamos que estamos alli ', () => {
        cy.BlogPage.homeClick();
        cy.BlogPage.getSubtitle()
            .should('contain', cy.BlogPage.subtitleHomeExpected);
        cy.BlogPage.urlResponse()
            .should('include', Cypress.config().baseUrl);
    });
});