context('Pruebas sobre login tanto ingreso como acceso no permitido', () => {
    beforeEach(() => {
        cy.visit('/sampleApp');
    });

    it('Test all logueo', () => {
        cy.contains('Sample App')
            .should('be.visible');
        cy.get('@credsAll').then((creds) => {
            creds.usuarios.forEach((usuario) => {
                cy.get('input[name="UserName"]').clear();
                if (usuario.usuario) {
                    cy.get('input[name="UserName"]')
                        .type(usuario.usuario);
                }

                cy.get('input[name="Password"]').clear().type(usuario.clave);

                cy.get('#login').click();

                if (usuario.condicion === 'valid') {
                    cy.get('#loginstatus').should('include.text', 'Welcome');
                    cy.get('#login').click(); // Logout
                    cy.get('#loginstatus').should('include.text', 'User logged out');
                } else {
                    cy.get('#loginstatus').should('include.text', 'Invalid username/password');
                }
            });
        });
    });
});