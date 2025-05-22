context('Example 01', () => {

    it('Test #1', () => {
        cy.contains('todos')
            .should('contain', 'todos');
        cy.get('h1')
            .should('contain', 'todos')
    });

    it('Test #2', () => {
        cy.get('body > section > div > section > ul')
            .its('length')
            .should('be.greaterThan', 0);
        cy.get('[data-test="new-todo"]')
            .its('length')
            .should('be.greaterThan', 0);

    });

    it('Test #3', () => {
        cy.get('.dropdown-toggle')
            .click();
        cy.get(':nth-child(12) > a')
            .should('contain', 'Waiting')
            .click();
        cy.get('h1')
            .should('contain', 'Waiting')

    });
});