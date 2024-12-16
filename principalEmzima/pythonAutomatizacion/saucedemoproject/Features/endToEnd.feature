Feature: Return to Home Page After Checkout and Logout

  Scenario Outline: I log in, add a product to the cart, complete the purchase, and log out
    Given I'm a registered user on the website
    When I entered the "Username" and "Password"
    And I did click on "Login" button
    And I did click on the "Add to cart" button for the <product>
    And I did click on the cart icon
    And I did click on the "Checkout" button
    And I filled the field for the <first_name>
    And I filled the field for the <last_name>
    And I filled the field for the <zip_code>
    And I did click on the "Continue" button
    And I did click on the "Finish" button
    And I did click on the "Back Home" button
    And I displayed the hamburger menu
    And I logged out
    Then I want to be redirected to the homepage

    Examples:
      | product             | first_name | last_name | zip_code |
      | Sauce Labs Backpack | Carlos     | Alonso    | C1429SAV |
