describe('Página de inicio, dropdown y selecciones específicas', () => {
  it('deberían dirigirse a la página de input, rellenar campo y verificar texto', () => {
    cy.visit('/');
    
    // 1. Hacer clic en el dropdown y verificar texto
    cy.get('.dropdown-toggle').click();
    cy.get('.dropdown-menu > :nth-child(3) > a')
      .should('contain', 'Actions') // Primero verifica que el elemento contenga el texto
      .click(); // Luego haz clic

    // 2. Rellenar campo de email y verificar valor
    cy.get('.action-email')
      .type('fake@email.com')
      .should('have.value', 'fake@email.com');
  });
});