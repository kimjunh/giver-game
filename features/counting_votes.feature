Feature: Display votes
  As a user who has created a giving game
  So that I can see the vote counts of the giving game
  I would like to be able to see the giving games display vote counts after a player votes
 
  Background: games exist
    Given I am on the home page
    And the following games exist:
    | title                   | description                                 | charityA_title | charityB_title | votesA | votesB |
    | Tutorial                | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | 0      | 0      |
  
  Scenario: Select game and vote
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Tutorial" in my table
    When I follow "Tutorial" in my table
    Then I should be on the game page for "Tutorial"
    And I press "Donate to Charity A"
    Then I should be on the results page for "Tutorial"
    And I should see "Votes for Charity A: 1"

  Scenario: Selecting one charity and confirming the votes for the other charity did not increase
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Tutorial" in my table
    When I follow "Tutorial"
    And I press "Donate to Charity A"
    Then I should be on the results page for "Tutorial"
    And I should see "Votes for Charity B: 0"
