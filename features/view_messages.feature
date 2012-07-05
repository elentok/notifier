Feature: View messages
  As a user
  I want to see messages sent to me 
  so I can know what happened

  Scenario: guest is redirected to the login page
    Given a guest user
    When I visit the messages page
    Then I am redirected to the login page

  @javascript
  Scenario: user sees a list of his messages
    Given a logged-in user named "bob"
    And a user named "joe"
    And the following messages:
      | title      | body               | recipients |
      | message #1 | body of message #1 | bob        |
      | message #2 | body of message #2 | bob, joe   |
      | message #3 | body of message #3 | joe        |
    When I visit the messages page
    Then I see the following messages:
      | title      |
      | message #1 |
      | message #2 |

  @javascript
  Scenario: user sees the messages sorted by their creation date
    Given a logged-in user named "bob"
    And the following messages:
      | title      | body               | created_at       | recipients |
      | message #2 | body of message #2 | 2012-01-03 10:50 | bob        |
      | message #1 | body of message #1 | 2012-01-03 10:40 | bob        |
      | message #3 | body of message #3 | 2012-03-03 10:60 | bob        |
    When I visit the messages page
    Then I see the following messages:
      | title      |
      | message #3 |
      | message #2 |
      | message #1 |

