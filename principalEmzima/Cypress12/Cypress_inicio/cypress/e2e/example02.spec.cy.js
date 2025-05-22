describe('Página de inicio, lista de elementos del body y placeholder', () => {
    it('deberían leerse los textos indicados en el body tanto de la lista como del placeholder', () => {
      cy.visit('/');
      cy.get('.todo-list li') // Selecciona todos los items de la lista
      .should('contain', 'Walk the dog') // Verifica que  contenga el texto
      // ;
      // cy.get('.todo-list li') // Selecciona todos los items de la lista
      //.should('contain', 'Pay electric bill'); // Verifica que contenga el texto
      .and('contain', 'Pay electric bill');
      
      cy.get('[data-test="new-todo"]') // Selecciona todos los items de la lista
      .should('have.attr', 'placeholder', 'What needs to be done?'); // Verifica el placeholder
    });
  });