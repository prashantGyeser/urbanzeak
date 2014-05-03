Feature: Sign in
  Scenario: Successfully sign in
    Given I want to sign in
    When I enter valid credentials
    Then I should be logged into urbanzeak

  Scenario: Unsuccessful sign in
    Given I want to sign in
    When I enter invalid credentials
    Then I should not be logged in
