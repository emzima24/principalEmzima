describe('Página de inicio', () => {
  it('debería cargar correctamente', () => {
    cy.visit('https://example.cypress.io/todo#', {
      timeout: 60000,
      retryOnNetworkFailure: true
    });
    cy.contains('todos', { timeout: 10000 });
  });
});