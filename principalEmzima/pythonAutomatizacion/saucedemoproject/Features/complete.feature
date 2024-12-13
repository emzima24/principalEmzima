Feature: Return to Home Page After Checkout

  Scenario Outline: Logout and navigate to home page
    Given I'm a registered user on the <website>
    When I entered the username and password
    And I did click on Login button
    And I did click on the "Add to cart" button for the <product>
    And I did click on the cart icon
    And I did click on the "Checkout" button
    And I did click on the "Finish" button
    And I filled the field for the <First_Name>
    And I filled the field for the <Last_Name>
    And I filled the field for the <Zip_Code>
    And I did click on the "Continue" button
    And I did complete the transaction
    And I did click on the "Back Home" button
    Then I want to see a catalog page

    Examples:
| website                     | First_Name | Last_Name | Zip_Code | product                           |
| https: // www.saucedemo.com | Carlos     | Alonso    | C1429SAV | Sauce Labs Backpack               |
| https: // www.saucedemo.com | Carlos     | Alonso    | C1428SAV | Sauce Labs Bike Light             |
| https: // www.saucedemo.com | Carlos     | Alonso    | C1427SAV | Sauce Labs Bolt T-shirt           |
| https: // www.saucedemo.com | Carlos     | Alonso    | C1426SAV | Sauce Labs Fleece Jacket          |
| https: // www.saucedemo.com | Carlos     | Alonso    | C1425SAV | Sauce Labs Onesie                 |
| https: // www.saucedemo.com | Carlos     | Alonso    | C1424SAV | Test.allTheThings() T-shirt (Red) |