// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })
const { obtenerAtributoProducto } = require('./functionProducts');

Cypress.Commands.add('obtenerAtributoProducto', (productos, nombreProducto, atributo) => {
  return obtenerAtributoProducto(productos, nombreProducto, atributo);
});

// Cypress.Commands.add('loadFixtures', () => {
//   cy.fixture('Users/standardUser').then((creds) => {
//     Cypress.env('credentials', creds);  // Guardar en el entorno de Cypress
//   });
//   cy.fixture('Products/productos').then((data) => {
//     Cypress.env('productos', data);  // Guardar en el entorno de Cypress
//   });
// });
