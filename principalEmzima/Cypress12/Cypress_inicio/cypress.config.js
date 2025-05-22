const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    experimentalMemoryManagement: true,
    baseUrl: 'https://example.cypress.io/todo#', // Ajusta esto
    specPattern: 'cypress/e2e/**/*.spec.cy.js',    // Patrón de archivos
    defaultCommandTimeout: 10000,
    pageLoadTimeout: 60000,
    experimentalRunAllSpecs: true, 
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
