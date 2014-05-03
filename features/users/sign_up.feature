Feature: Sign up
  Sign up should be quick and friendly
  Scenario: Successful sign up
    Given I want to sign up
    When I enter valid details
    Then I should see a greeting

  Scenario: Duplicate email
    Where someone tries to sign up with an email that already exists
    Given I want to sign up
    When I enter an email that is already registered
    Then I should be told the email already exists