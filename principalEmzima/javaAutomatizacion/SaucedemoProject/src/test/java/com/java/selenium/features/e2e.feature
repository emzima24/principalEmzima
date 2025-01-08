@allure.label.layer:web
@allure.label.owner:emzima
Feature: Return to Login Page After Logout

  @critical
  Scenario Outline: I log in, add a product to the cart, complete the purchase, and log out
    Given I go to the website as a registered user
    When I enter the username and password
    And I click on Login button
    And I click on the Add to cart button for the "<product>"
    And I click on the cart icon
    And I click on the Checkout button
    And I filled the field for the first_name with value first_name
    And I filled the field for the last_name with value last_name
    And I filled the field for the zip_code with value zip_code
    And I click on the Continue button
    And I click on the Finish button
    And I click on the Back Home button
    And I display the hamburger menu
    And I log out
    Then I want to go to the login page

    Examples:
| product                           |
| Sauce Labs Backpack               |
#| Sauce Labs Bike Light             |
#| Sauce Labs Bolt T-Shirt           |
#| Sauce Labs Fleece Jacket          |
#| Sauce Labs Onesie                 |
#| Test.allTheThings() T-Shirt (Red) |