Feature: As a user who wants to play
  So that I can learn about charities and choose to donate from among many games
  I want to select a game among the current active games and play
  
  Background: games exists 
    Given I am on the home page
    And the following games exist:
    | title                   | description                                 | charityA_title | charityB_title | show_results |
    | Tutorial                | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | true         |
    | Tutorial 2              | 'This is another tutorial!'                 | Charity 1      | Charity 2      | true         |
    | Regular Game            | 'This is a game'                            | Charity 3      | Charity 4      | true         |
  
  Scenario: Go to the games page and select a game 
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Regular Game" in my table
    When I follow "Regular Game" in my table
    Then I should be on the game page for "Regular Game"
    And I should see "This is a game"
    
  Scenario: Go back to existing games page from game page 
    When I follow "Play a giving game"
    And I follow "Regular Game" in my table
    And The game "Regular Game" should be able to show results
    And I press "Donate to Charity 3"
    And I should be on the results page for "Regular Game"
    When I follow "Go Back to Games List"
    Then I should be on the existing games page