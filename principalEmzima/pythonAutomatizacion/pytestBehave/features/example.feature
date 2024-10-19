Feature: Go to on test page on login

  Scenario: Open website and check it's title  # [AS]<who><where><when> I [WANT]<what> [TO]because<why> or title short 
    Given I want to launch the browser 
    When I enter the <website> in the navegation bar and go there
    Then I verify that page by it is title