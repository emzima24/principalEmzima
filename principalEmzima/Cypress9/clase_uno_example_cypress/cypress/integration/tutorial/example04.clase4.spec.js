beforeEach(() => {
    // Hook a nivel raíz
    cy.log('Root Before each');
});


context('Hooks', () => {
    before(() => {
        cy.log('Before: se ejecuta una vez antes de todas las pruebas en el bloque');
    });
    beforeEach(() => {
        cy.log('BeforeEach: se ejecuta antes de cada prueba en el bloque');
    });
    it('Test 01', () => {
        // Sin acciones, solo observamos la ejecución
    });
    it('Test 02', () => {
        // Sin acciones, solo observamos la ejecución
    });
    afterEach(() => {
        cy.log('After Each: se ejecuta después de cada prueba en el bloque');
    });
    after(() => {
        cy.log('After: se ejecuta una vez después de todas las pruebas en el bloque');
    });
});




context('Hooks #2', () => {
    //Al correr este contexto, SOLO se ejecuta BeforeEach para cada test.
    it('Test 01', () => {
        // Sin acciones, solo observamos la ejecución
    });
    it('Test 02', () => {
        // Sin acciones, solo observamos la ejecución
    });
});