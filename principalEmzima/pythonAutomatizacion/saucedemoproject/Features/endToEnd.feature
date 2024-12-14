Feature: Return to Login Page After Logout 

  Scenario Outline: Login, Add to cart, Overview, Checkout, Finish, Logout
    Given I go to the website as a registered user
    When I enter the username and password
    And I click on Login button
    And I click on the "Add to cart" button for the <product>
    And I click on the cart icon
    And I click on the "Checkout" button
    And I fill First Name field with <first_name>
    And I fill Last Name field with <last_name>
    And I fill Zip Code field with <zip_code>
    And I click on the "Continue" button
    And I click on the "Finish" button
    And I click on the "Back Home" button
    And I display the hamburger menu
    And I log out
    Then I want to go to the login page

    Examples:
| first_name | last_name | zip_code | product                           |
| Carlos     | Alonso    | C1429SAV | Sauce Labs Backpack               |
| Carlos     | Alonso    | C1428SAV | Sauce Labs Bike Light             |
| Carlos     | Alonso    | C1427SAV | Sauce Labs Bolt T-shirt           |
| Carlos     | Alonso    | C1426SAV | Sauce Labs Fleece Jacket          |
| Carlos     | Alonso    | C1425SAV | Sauce Labs Onesie                 |
| Carlos     | Alonso    | C1424SAV | Test.allTheThings() T-shirt (Red) |