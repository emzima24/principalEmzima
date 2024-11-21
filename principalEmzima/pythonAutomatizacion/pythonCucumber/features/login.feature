Feature: Go to on test page on login

  Scenario Outline: Login test in ulr
    Given I'm a registered user on the <website>
    When I enter my <username> and <password>
    And click on the login buttom
    Then I can log in or receive error <message>

    Examples:
      | website                                                 | username | password    | message                                              |
      | https://practicetestautomation.com/practice-test-login/ | student  | Password123 | Congratulations student. You successfully logged in! |
      | https://practicetestautomation.com/practice-test-login/ | student  | Passwor     | Your password is invalid!                            |
      | https://practicetestautomation.com/practice-test-login/ | st       | Password123 | Your username is invalid!                            |
      # | https://practicetestautomation.com/practice-test-login/ | student  |             | Your password is invalid!                            |
      # | https://practicetestautomation.com/practice-test-login/ |          | Password123 | Your username is invalid!                            |
      # | https://practicetestautomation.com/practice-test-login/ |          |             | Your username is invalid!                            |
