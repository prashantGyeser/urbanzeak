#Feature: Reset password
#  Scenario: Succesfully send a email with a link to the reset password form
#    Given I want to reset my password
#    Given a clear email queue
#    When I want to reset the password for "cucumber@urbanzeak.com"
#    Then I should receive an email
#    And I opens the email
#    And I should see "Change my password" in the email
#    When I click the first link in the email
#    Then I should be able to change my password
#
