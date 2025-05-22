/// <reference types='cypress' />


context('Alias y variables', () => {
    beforeEach(() => {
        cy.visit('/');
    });


    it('Test 01', () => {
        // Variable para almacenar el texto de la nueva tarea
        const TEXTO_TAREA = "Something...";


        // Agrega una nueva tarea usando el valor de la variable
        cy.get('.new-todo').type(`${TEXTO_TAREA}{enter}`);


        // Asigna un alias a los elementos de la lista de tareas
        cy.get('.todo-list li').as('items');


        // Verifica la cantidad de tareas usando el alias
        cy.get('@items').should('have.length', 3);


        // También puedes verificar sin alias, repitiendo el selector
        cy.get('.todo-list li').should('have.length', 3);
    });
});

