Feature: Cart and Product Selection
  @cart @categories @regression
  Scenario: Select the Laptops category and a random product by the cards
    Given I navigate to the home page
    When I select the "Laptops" category
    And I click on a random product by the cards
    Then I should be taken to the product page

  Scenario: Select the Monitors category and a random product by the cards
    Given I navigate to the home page
    When I select the "Monitors" category
    And I click on a random product by the cards
    Then I should be taken to the product page

  Scenario: Select the Phones category and a random product by the cards
    Given I navigate to the home page
    When I select the "Phones" category
    And I click on a random product by the cards
    Then I should be taken to the product page

  Scenario: Select the random category and a random product by link
    Given I navigate to the home page
    When I select a random category
    And I click a random product by link
    Then I should be taken to the product page

  Scenario: Select a product by name and use next button
    Given I navigate to the home page
    When I search and click on "Dell i7 8gb"
    Then I should be taken to the product page

  Scenario: Select a category and a product by name
    Given I navigate to the home page
    When I select the "Phones" category
    And I search and click on "Samsung galaxy s7"
    Then I should be taken to the product page