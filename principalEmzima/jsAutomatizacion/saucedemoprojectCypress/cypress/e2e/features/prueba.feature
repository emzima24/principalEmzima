Feature: Google Main Page

  I want to open a search engine
  
  Scenario: Opening a search engine page
    Given I open Google page
    When I write in the search bar "egg.live"
    Then I see "Google" in the title