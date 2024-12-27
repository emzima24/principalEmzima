const { defineConfig } = require('cypress');

module.exports = defineConfig({
  projectId: 'z4p474',
  chromeWebSecurity:false,
  watchForFileChanges: false,
  e2e: {
    baseUrl: 'https://www.saucedemo.com/',
    specPattern: 'cypress/e2e/**/*.{js,jsx,ts,tsx,feature}',
    supportFile: 'cypress/support/index.js',
    testIsolation: true,
    setupNodeEvents(on, config) {
      const cucumber = require('cypress-cucumber-preprocessor').default
      on('file:preprocessor', cucumber())
    },
  },
  });
