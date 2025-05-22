describe('Prueba de botón START/STOP', () => {
  //let testCases;

  it('Prueba boton, debería cambiar de START a STOP al hacer clic', () => {
    cy.get('button.start')
      .should('be.visible')
      .and('have.attr', 'name', 'start')
      .and('contain', 'START');
    cy.get('button.start')
      .click();

    cy.get('button.stop')
      .should('be.visible')
      .and('have.attr', 'name', 'stop')
      .and('contain', 'STOP');
  });

  it('Prueba radio buttom, debería seleccionar la opción femenino', () => {
    cy.get('#female')
      .check()
      .should('be.checked');

    cy.get('#male')
      .should('not.be.checked');

    cy.get('input[name="gender"]:checked')
      .should('have.value', 'female');
  });

  it('Ventana emergente, debería manejar cuando se hace clic en Aceptar', () => {

    cy.window().then((win) => {
      cy.stub(win, 'confirm')
        .returns(true)
        .as('confirmAccept');
    });

    cy.get('#confirmBtn')
      .click();
    cy.get('@confirmAccept')
      .should('be.calledWith', 'Press a button!');
    cy.get('#demo')
      .should('contain.text', 'You pressed OK!')
  });

  it('Ventana emergente, debería manejar cuando se hace clic en Cancelar', () => {

    cy.window().then((win) => {
      cy.stub(win, 'confirm')
        .returns(false)
        .as('confirmCancel');
    });

    cy.get('#confirmBtn')
      .click();
    cy.get('@confirmCancel')
      .should('be.calledWith', 'Press a button!');
    cy.get('#demo')
      .should('contain.text', 'You pressed Cancel!')

  });

  it('Prueba de hoover dropdown emergente, debería funcionar con hover real', () => {

    cy.get('.dropbtn')
      .realHover();
    cy.get('.dropdown-content a')
      .contains('Mobiles')
      .should('be.visible')
      .click();
  });

  it('Prueba de boton con doble click, debería copiar texto de Field1 a Field2 al hacer doble clic', () => {

    cy.get('#field2')
      .clear();
    cy.get('#field1')
      .should('have.value', 'Hello World!');
    cy.get('#field2')
      .should('have.value', '');
    cy.get('#HTML10 > .widget-content > button')
      .dblclick();
    cy.get('#field2')
      .should('have.value', 'Hello World!');
    cy.get('#field1')
      .should('have.value', 'Hello World!');
  });


  it.only('Prueba de botón con doble clic con fixture: debería copiar texto de Field1 a Field2 al hacer doble clic', () => {
    cy.get('@cases').then((testCases) => {
      testCases.forEach(({
        input,
        output
      }) => {
        cy.get('#field1')
          .clear()
          .type(input);

        cy.get('#field2')
          .clear();

        cy.get('#HTML10 > .widget-content > button')
          .dblclick();

        cy.get('#field2')
          .should('have.value', output);
      });
    });
  });
});