var pageLocators = {
    newTodoInput: '.new-todo',
    allLink: 'a:contains("All")',
    activeLink: 'a:contains("Active")',
    completedLink: 'a:contains("Completed")',
    todoCount: '.todo-count > strong',
  }
 
  class TodosPage {
    newTodoInput() { return cy.get(pageLocators.newTodoInput); }
    allLink() { return cy.get(pageLocators.allLink); }
    activeLink() { return cy.get(pageLocators.activeLink); }
    completedLink() { return cy.get(pageLocators.completedLink); }
    todoToggle(id) { return cy.get(':nth-child(' + id + ') > .view > .toggle'); }
    todoCount() { return cy.get(pageLocators.todoCount).invoke('text').then(parseInt);}
 
    addTodo(todo) { return this.newTodoInput().type(todo + '{enter}'); }
    clickTodoToggle(id) { return this.todoToggle(id).click(); }
    clickCompletedLink() { return this.completedLink().click(); }
  }
  export default TodosPage;