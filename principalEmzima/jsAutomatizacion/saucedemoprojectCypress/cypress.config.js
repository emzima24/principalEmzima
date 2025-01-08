// const { defineConfig } = require('cypress');
// const { allureCypress } = require('allure-cypress/reporter');
// const createBundler = require('@bahmutov/cypress-esbuild-preprocessor');
// const { addCucumberPreprocessorPlugin } = require('@badeball/cypress-cucumber-preprocessor');
// const { createEsbuildPlugin } = require('@badeball/cypress-cucumber-preprocessor/esbuild');
// const newLocal = 'cypress-on-fix';
// const cypressOnFix = require(newLocal);


// module.exports = defineConfig({
//   projectId: 'z4p474',
//   chromeWebSecurity: false,
//   watchForFileChanges: false,
//   e2e: {
//     baseUrl: 'https://www.saucedemo.com/',
//     specPattern: 'cypress/e2e/**/*.{cy.js,js,jsx,ts,tsx,feature}',
//     supportFile: 'cypress/support/index.js',
//     testIsolation: true,
//     async setupNodeEvents(on, config) {
//       on = cypressOnFix(on);

//       await addCucumberPreprocessorPlugin(on, config);

//       on('file:preprocessor', createBundler({
//         plugins: [createEsbuildPlugin(config)],
//       }));

//       allureCypress(on, config, {
//         resultsDir: 'cypress/reports/allure-results',
//       });

//       return config;
//     },
//   },
// });

// Esta configuracion funcionaba sin allure con allure se rompio todo
const { defineConfig } = require('cypress');
const preprocessor = require('@badeball/cypress-cucumber-preprocessor').default;
const browserify = require('@badeball/cypress-cucumber-preprocessor/browserify').default;

module.exports = defineConfig({
  projectId: 'z4p474',
  chromeWebSecurity: false,
  watchForFileChanges: false,
  e2e: {
    baseUrl: 'https://www.saucedemo.com/',
    specPattern: 'cypress/e2e/**/*.{js,jsx,ts,tsx,feature}',
    supportFile: false, //'cypress/support/index.js',
    testIsolation: true,
    async setupNodeEvents (on, config) {
      if (!config) {
        throw new Error('Config object is undefined');
      }
      on('file:preprocessor', browserify(config));
      await preprocessor.addCucumberPreprocessorPlugin(on, config);

      return config;
    },
  },
});