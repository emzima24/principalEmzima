context('Pruebas sobre wait', () => {
    beforeEach(() => {
        cy.visit('/ajax').as('ajaxPage'); 
    });
    
    it('Test #00 verificación inicial', () => {
        cy.contains('AJAX Data');
    });
    
    it('Test #01 interacción con AJAX', () => {
        cy.get('@ajaxPage'); 
        cy.contains('AJAX Data');
        cy.get('#ajaxButton').click();
    });
});