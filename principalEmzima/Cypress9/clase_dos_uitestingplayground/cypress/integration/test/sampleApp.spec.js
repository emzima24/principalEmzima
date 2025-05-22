context('Pruebas sobre login', () => {

    beforeEach(() => {
        cy.visit('/sampleApp');
    });

    it('Test #01 - Login con usuarios válidos', () => {

        cy.contains('Sample App')
            .should('be.visible');
        cy.get('@creds').then((creds) => {
            creds.usuarios_validos.forEach((usuario) => {
                cy.get('input[name="UserName"]')
                    .clear()
                    .type(usuario.usuario);
                cy.get('input[name="Password"]')
                    .clear()
                    .type(usuario.clave);
                cy.get('#login')
                    .click();
                cy.get('#loginstatus')
                    .should('include.text', 'Welcome');
                cy.get('#login')
                    .click();
            });
        });
    });

    it.only('Test #02 - Login con usuarios no válidos', () => {
        cy.contains('Sample App').should('be.visible');

        cy.get('@creds').then((creds) => {
            creds.usuarios_invalidos.forEach((usuario) => {
                cy.get('input[name="UserName"]')
                    .clear()
                if (usuario.usuario) {
                    cy.get('input[name="UserName"]')
                        .type(usuario.usuario);
                }

                cy.get('input[name="Password"]')
                    .clear()
                    .type(usuario.clave);

                cy.get('#login')
                    .click();

                cy.get('#loginstatus')
                    .should('not.include.text', 'Welcome');

                cy.get('#loginstatus')
                    .should('include.text', 'Invalid username/password');
            });
        });
    });

    //     it.only('Test #02 logueo invalido', () => {
    //     cy.contains('Sample App').should('be.visible');
    //     cy.get('@creds').then((creds) => {
    //       creds.usuarios.forEach((usuario) => {
    //         cy.get('input[name="UserName"]').clear();
    //         if (usuario.usuario !== null) {
    //           cy.get('input[name="UserName"]').type(usuario.usuario);
    //         }

    //         cy.get('input[name="Password"]').clear().type(usuario.clave);

    //         cy.get('#login').click();

    //         if (usuario.condicion === 'valid') {
    //           cy.get('#loginstatus').should('include.text', 'Welcome');
    //           cy.get('#login').click(); // Logout
    //           cy.get('#loginstatus').should('include.text', 'User logged out');
    //         } else {
    //           cy.get('#loginstatus').should('include.text', 'Invalid username/password');
    //         }
    //       });
    //     });
    //   });
});