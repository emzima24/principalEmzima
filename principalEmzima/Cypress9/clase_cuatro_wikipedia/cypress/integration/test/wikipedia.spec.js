describe('Prueba de búsqueda en Wikipedia', () => {
    it('“Test 01 - BDD Expectations, Debería encontrar la página de Globant', () => {
        cy.visit('https://wikipedia.org');
        cy.get('#searchInput')
            .type('Globant{enter}');
        cy.get('h1#firstHeading')
            .should("be.visible")
            .should('contain', 'Globant');
        cy.title()
            .should('include', 'Globant - Wikipedia');

    })

    it('“Test 02 - BDD Expectations wait, Debería encontrar la página de Globant', () => {
        cy.visit('https://wikipedia.org');
        cy.wait(6000);
        cy.get('#searchInput')
            .type('Globant{enter}');
        cy.get('h1#firstHeading')
            .should("be.visible")
            .should('contain', 'Globant');
        cy.wait(6000);
        cy.title()
            .should('include', 'Globant - Wikipedia')
    })
})