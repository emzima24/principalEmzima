Feature: Go to on test page on login

  Scenario Outline: Login test in ulr
    Given I'm a registered user on the <website>
    When I enter my <username> and <password>
    And click on the login buttom
    Then I can log in or receive error <message>

    Examples:
      | website                    | username      | password     | message |
      | https://www.saucedemo.com/ | error_user    | secret_sauce |         |
      | https://www.saucedemo.com/ | standard_user | secret_sauce |         |
