Feature: See the turn
  In order to see how soon I will on duty
  As a cleaner
  I want to see the turn

  Scenario: See the turn
    Given I am logged in
    And there is a turn with two people
    And I joined this turn this week
    When I view the turns
      Then I should see that my turn to be on duty will be in two weeks
