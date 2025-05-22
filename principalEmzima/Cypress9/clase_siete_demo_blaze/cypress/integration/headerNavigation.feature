# cypress/e2e/header_navigation.feature

Feature: Header Navigation

Background:
  Given I am on the home page

  @header @sanity
  Scenario: Verify header buttons
    Then I should see the following buttons in the header: "Home, Contact, About Us, Cart, Log In, Sign Up"

  Scenario: Navigate to Home from product page
    Given I am on a "product details" page
    When I click on the "Home" link in the header
    Then I should be redirected to the home page

  Scenario: Navigate to Home from Cart page
    Given I am on a "Cart" page
    When I click on the "Home" link in the header
    Then I should be redirected to the home page

  Scenario: Open Contact modal
    When I click on the "Contact" link in the header
    Then I should see the "Contact" modal

  Scenario: Open About us modal
    When I click on the "About us" link in the header
    Then I should see the "About us" modal
  
  Scenario: Open Log in modal
    When I click on the "Log in" link in the header
    Then I should see the "Log in" modal

  Scenario: Open Sign in modal
    When I click on the "Sign up" link in the header
    Then I should see the "Sign up" modal