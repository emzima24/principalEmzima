Feature: Return to Login Page After Logout 

 Scenario Outline: I log in, add a product to the cart, complete the purchase, and log out
    Given I go to the website as a registered user
    When I enter the username and password
    And I click on Login button
    And I click on the Add to cart button for the <product>
    And I click on the cart icon
    And I click on the Checkout button
    And I filled the field for the first_name with <first_name>
    And I filled the field for the last_name with <last_name>
    And I filled the field for the zip_code with <zip_code> 
    And I click on the Continue button
    And I click on the Finish button
    And I click on the Back Home button
    And I display the hamburger menu
    And I log out
    Then I want to go to the login page

    Examples:
| product                           | first_name | last_name | zip_code |
| Sauce Labs Backpack               | Carlos     | Alonso    | C1429SAV |
| Sauce Labs Bike Light             | Carlos     | Alonso    | C1428SAV |
| Sauce Labs Bolt T-Shirt           | Carlos     | Alonso    | C1427SAV |
| Sauce Labs Fleece Jacket          | Carlos     | Alonso    | C1426SAV |
| Sauce Labs Oneise                 | Carlos     | Alonso    | C1425SAV |
| Test.allTheThings() T-Shirt (Red) | Carlos     | Alonso    | C1424SAV |
  