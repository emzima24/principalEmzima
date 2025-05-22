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

Cypress.Commands.add('clickCarouselAndWait', (carouselClickFn) => {
  carouselClickFn();
  cy.HomePage.getWaitForCarouselReady();
});

Cypress.Commands.add('elementCategoryClick', (categoryText) => {
  if (typeof categoryText === 'undefined') {
    categoryText = Cypress.env('expectedData').elementCategory[Cypress._.random(0, Cypress.env('expectedData').elementCategory.length - 1)];
    cy.wrap(categoryText).as('randomSelectedCategory');
  }
  return cy.contains(Cypress.env('pageLocators').categoryListClass, categoryText).click();
});

Cypress.Commands.add('getModalTitle', (modalName) => {
  return cy.get(`#${modalName}ModalLabel`);
});

Cypress.Commands.add('closeModal', (modalName, position = 'footer') => {
  if (position === 'footer') {
    const BUTTON_CLASS = modalName === 'AboutUs' ? '.btn' : '.btn-secondary';
    return cy.get(`#${modalName}Modal > .modal-dialog > .modal-content > .modal-footer > ${BUTTON_CLASS}`).click();
  } else { // header
    return cy.get(`#${modalName}Modal > .modal-dialog > .modal-content > .modal-header > .close > span`).click();
  }
});

Cypress.Commands.add('waitForModal', (modalName, action = 'show') => {
  return cy.window().then({
    timeout: 10000
  }, (win) => {
    return new Cypress.Promise((resolve) => {
      const $MODAL = win.$(`#${modalName}Modal`);

      if (action === 'show') {
        if ($MODAL.hasClass('show') && !$MODAL.data('_isTransitioning')) {
          resolve();
        } else {
          $MODAL.on('shown.bs.modal', () => resolve());
        }
      } else { // 'hide'
        if (!$MODAL.hasClass('show')) {
          resolve();
        } else {
          $MODAL.on('hidden.bs.modal', () => resolve());
        }
      }
    });
  });
});

Cypress.Commands.add('getAlertMessage', (callback) => {
  cy.on(Cypress.env('pageLocators').alertWindow, (str) => {
    callback(str);
  });
});

Cypress.Commands.add('clickRandomProductByImage', () => {
  cy.get('#tbodyid .card img.card-img-top', {
      timeout: 10000
    })
    .should('have.length.gt', 0)
    .then($images => {
      const index = Cypress._.random(0, $images.length - 1);
      const $img = $images.eq(index);
      const productName = $img.closest('.card')
        .find('.card-title a')
        .text()
        .trim();

      cy.wrap(productName).as('selectedProductName');
      cy.wrap($img)
        .click({
          force: true
        });
    });
});

Cypress.Commands.add('clickProductCardByName', (productName, maxPages = 2) => {
  function searchProduct(page = 1) {
    cy.log(`Buscando "${productName}" en página ${page}`);

    cy.get('#tbodyid .card .card-title a.hrefch', {
        timeout: 10000
      })
      .should('have.length.gt', 0)
      .then(($links) => {
        const FOUND_LINK = [...$links].find(link =>
          link.textContent.trim() === productName
        );

        if (FOUND_LINK) {
          cy.wrap(FOUND_LINK.textContent.trim())
            .as('selectedProductName');
          cy.wrap(FOUND_LINK)
            .as('prtChoice');
          return cy.wrap(FOUND_LINK)
            .click({
              force: true
            });
        } else if (page < maxPages && Cypress.$('#next2:not(:disabled)').length) {
          cy.get('#next2')
            .click();
          cy.wait(3000);
          return searchProduct(page + 1);
        } else {
          const AVAILABLE_PRODUCTS = [...$links].map(link => link.textContent.trim());
          throw new Error(`Producto "${productName}" no encontrado después de ${page} páginas. Productos disponibles: ${AVAILABLE_PRODUCTS.join(', ')}`);
        }
      });
  }

  searchProduct(1);
});


Cypress.Commands.add('addRandomDistinctProducts', (min = 2, max = 15) => {
  const ALL_PRODUCTS = [
    ...Cypress.env('laptopsData'),
    ...Cypress.env('monitorsData'),
    ...Cypress.env('phonesData')
  ];

  const QTY = Cypress._.random(min, max);
  const SELECTED_PRODUCTS = Cypress._.sampleSize(ALL_PRODUCTS, QTY);
  cy.wrap(QTY).as('qtyAdded');

  cy.wrap(SELECTED_PRODUCTS.length).as('qtyAdded');

  Cypress.env('addedProductNames', []);

  cy.wrap(SELECTED_PRODUCTS).each((product) => {
    const PRODUCT_NAME = product.name;

    cy.clickProductCardByName(PRODUCT_NAME);

    cy.getAlertMessage((msg) => {
      expect(msg).to.equal('Product added');
    });

    cy.contains('Add to cart').click();

    Cypress.env('addedProductNames').push(name);

    cy.visit('/');

  });
})

Cypress.Commands.add('clickRandomProductCardByLink', () => {
  cy.get('#tbodyid .card .card-title a.hrefch', {
      timeout: 10000
    })
    .should('have.length.gt', 0)
    .then($links => {
      const PRODUCT_NAMES = [...$links].map(el => el.textContent.trim());
      const RANDOM_INDEX = Cypress._.random(0, $links.length - 1);
      const PRODUCT_NAME = $links[RANDOM_INDEX].textContent.trim();

      cy.wrap(PRODUCT_NAMES)
        .as('productNames');
      cy.wrap(PRODUCT_NAME)
        .as('selectedProductName');

      cy.get('#tbodyid .card .card-title a.hrefch')
        .eq(RANDOM_INDEX)
        .should('be.visible')
        .then($element => {
          cy.wrap($element)
            .as('prtChoice');

          cy.wrap($element)
            .should('exist')
            .and('be.visible')
            .click({
              force: true
            });
        });
    });
});

Cypress.Commands.add('saveCategoryPRODUCTS', (categoryName) => {
  cy.visit('/', {
    cache: false
  });

  cy.get('.list-group').should('be.visible').within(() => {
    cy.contains('.list-group-item', categoryName)
      .should('be.visible')
      .click({
        force: true
      });
  });

  cy.get('#tbodyid .card', {
      timeout: 15000
    })
    .should(($cards) => {
      expect($cards.length).to.be.gt(0);
      const FIRST_PRODUCT = $cards.first()
        .find('.card-title a')
        .text()
        .trim();
      if (categoryName === 'Phones' && !FIRST_PRODUCT.match(/phone|samsung|iphone|nokia|sony|htc|motorola/i)) {
        throw new Error(`Producto no pertenece a la categoría Phones: ${FIRST_PRODUCT}`);
      }
      if (categoryName === 'Laptops' && !FIRST_PRODUCT.match(/laptop|notebook|vaio|macbook|dell|hp|asus/i)) {
        throw new Error(`Producto no pertenece a la categoría Laptops: ${FIRST_PRODUCT}`);
      }
      if (categoryName === 'Monitors' && !FIRST_PRODUCT.match(/monitor|screen|display|lg|samsung/i)) {
        throw new Error(`Producto no pertenece a la categoría Monitors: ${FIRST_PRODUCT}`);
      }
    })
    .then(($cards) => {
      const PRODUCTS = [];

      $cards.each((index, card) => {
        const $card = Cypress.$(card);
        PRODUCTS.push({
          category: categoryName,
          name: $card.find('.card-title a')
            .text()
            .trim(),
          price: $card.find('h5')
            .text()
            .trim(),
          description: $card.find('.card-text')
            .text()
            .trim()
        });
      });

      const EXPECTED_COUNTS = {
        Phones: 7,
        Laptops: 6,
        Monitors: 2
      };
      if (PRODUCTS.length !== EXPECTED_COUNTS[categoryName]) {
        cy.log(`Advertencia: ${categoryName} debería tener ${EXPECTED_COUNTS[categoryName]} productos, pero se encontraron ${PRODUCTS.length}`);
      }

      const FILENAME = `cypress/fixtures/${categoryName.toLowerCase()}.json`;
      cy.writeFile(FILENAME, PRODUCTS, {
        flag: 'w'
      });
      cy.log(`${PRODUCTS.length} productos de ${categoryName} guardados correctamente`);

      return cy.wrap(PRODUCTS);
    });
});