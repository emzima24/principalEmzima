import TodoPage from "../../support/pages/TodoPage.js";

const TODO_PAGE = new TodoPage();

const TASK_1 = "Present POM";
const TASK_2 = "Teach Cypress";

context("Example 01", () => {
  beforeEach(() => {
    cy.visit("/");
  });


  it("Test #1", () => {
    // Create a couple of tasks
    TODO_PAGE.addTodo(TASK_1);
    TODO_PAGE.addTodo(TASK_2);
    // Validate there exist a total of 4 tasks
    TODO_PAGE.todoCount().should("eq", 4);


    // Toggle the third task
    TODO_PAGE.clickTodoToggle(2);


    // Validate there exist a total of  3 tasks
    TODO_PAGE.todoCount().should("eq", 3);


    // Open completed tasks tab
    TODO_PAGE.clickCompletedLink();
  });
});
