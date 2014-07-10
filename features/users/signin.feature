Feature: Sign in
  In order to the content like comments, photos can be displayed with the author
  And appear more trustworthy
  Authors have to sign in

  Scenario: Sign in
    Given there is my account in the system
    And I navigate to the home page
    When I click Sign in
    And I enter my creadentials
      Then I should be logged in successfully
