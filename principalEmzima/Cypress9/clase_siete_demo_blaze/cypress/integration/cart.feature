Feature: Cart and Product Selection
  @cart @categories @regression

  # Scenario: Add product by name to cart
  #   Given I navigate to the home page
  #   When I search and click on "MacBook Pro"
  #   When I add the product to the cart
  #   Then I should see "MacBook Pro" listed in the "Cart"
    
  Scenario: Purchase product from cart
    Given I have products in my "Cart"
    When I proceed to checkout
    And I complete the purchase
    Then I receive the electronic invoice for the purchase

  # Scenario: Remove a product from the cart
  #   Given I have products in my cart
  #   When I remove a product
  #   Then it should no longer appear in the cart