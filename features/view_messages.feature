Feature: View messages
  As a user
  I want to see messages sent to me 
  so I can know what happened

  Scenario: guest is redirected to the login page
    Given a guest user
    When I visit the messages page
    Then I am redirected to the login page

  Scenario: user sees a list of his messages
    Given a logged-in user
    And the user has 3 messages
    When I visit the messages page
    Then I see 3 messages

  Scenario: user doesn't see messages that weren't sent to him
    Given a logged-in user
    And a message with no recipients
    When I visit the messages page
    Then I see 0 messages


