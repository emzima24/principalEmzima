context('Example 01', () => {

    it('Test #1', () => {
        cy.get('.new-todo')
            .type("My long task #1{enter}");
        cy.get('.new-todo')
            .type("My long task #2{enter}");
        cy.contains('Completed')
            .click();
        cy.get('ul.todo-list > li')
            .should('have.length', 0)
        cy.contains('Active')
            .click();
    });

    it('Test #2 con selectores XPath ', () => {
        cy.xpath('/html/body/section/div/header/input')
            .type("My long task #1{enter}");
        cy.xpath('/html/body/section/div/header/input')
            .type("My long task #2{enter}");
        cy.xpath('/html/body/section/div/footer/ul/li[3]/a')
            .click();
        cy.xpath('/html/body/section/div/footer/ul/li[2]/a')
            .click();
    });

    it('Test #3: Select using CSS selectors ', () => {
        cy.get('.new-todo')
            .type("My long task #1{enter}");
        cy.get('.new-todo')
            .type("My long task #2{enter}");
        cy.contains('My long task #2')
            .parents('li')
            .find('input.toggle')
            .check();
        cy.contains('Completed').click();
        cy.get('ul.todo-list > li')
            .should('have.length', 1)
            .and('contain.text', 'My long task #2');
    });

    it('Test #4: Select using CSS selectors  y otros cambios', () => {
        let startLi = 2;
        const TEXT = 'My long task #1';
        cy.get('.todo-list li').as('items')
            .should('have.length', startLi);
        cy.get('.new-todo')
            .type(TEXT + '{enter}');
        cy.get('@items')
            .should('contain', '#1')
            .and('have.length', ++startLi);
        cy.contains('label', TEXT)
            .parent()
            .find('input.toggle')
            .click()
            .parent()
            .parent()
            .should('have.class', 'completed');

    });

    it('Test #5: Reversing the Default Assertions', () => {
        cy.contains('Close')
            .should('not.exist');
        cy.get('.button-clase');
            //.should('not.exist');

    });

    it("Test 02", () => {

        cy.fixture("todos").as("todos");

        cy.get("@todos").then((todos) => {

            todos.todos.forEach((todo) => {
                cy.get(".new-todo").type(todo + "{enter}");
            });
        });
    });

    it('Test #4refac: Select using CSS selectors  y otros cambios', () => {
        let startLi = 2;
        cy.get('@all').then((all) => {
            all.todos.forEach((element) => {
                cy.get('.todo-list li') //.as('items')
                    .should('have.length', startLi);
                cy.get('.new-todo')
                    .type(element + '{enter}');
                cy.get('.todo-list li')
                    //.and('contain', '#1')
                    .should('have.length', ++startLi);
                cy.contains('label', element)
                    .parent()
                    .find('input.toggle')
                    .click()
                    .parent()
                    .parent()
                    .should('have.class', 'completed');
            });
        });

    });

});