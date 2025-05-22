Feature: Product Carousel
  @carousel @smoke @regression
  Scenario: Display initial products
    Given I navigate to the home page
    Then I should see a product in the carousel

  Scenario: Navigate through carousel products
    Given I navigate to the home page
    When I click the "next" button on the carousel
    Then I should see the expected "next" product

    Given I navigate to the home page
    When I click the "preview" button on the carousel
    Then I should see the expected "preview" product

  Scenario: Carousel loops back to the first product
    Given I navigate to the home page
    When I click the "next" button three times in the carousel
    Then I should see the first product

    Given I navigate to the home page
    When I click the "preview" button three times in the carousel
    Then I should see the first product