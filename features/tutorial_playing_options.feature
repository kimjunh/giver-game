Feature: Tutorial and playing options
  As a user
  I want to be able to have options about learning about the game, playing an existing game, or creating my own game
  So that I can learn about charities and choose how to go about a giving game

  Scenario: Users have access to a tutorial, seeing/playing existing games, and creating a new game from the home page
    Given that I am on the home page
    Then I should see "Play Tutorial" 
    Then I should see "Play a giving game"
    Then I should see "Create a new giving game"
    
  Scenario: Clicking on the Tutorial link should direct users to the tutorial
    Given that I am on the home page
    Then I should see "Play Tutorial" 
    When I click on "Play Tutorial"
    Then I should be on the tutorial page

  Scenario: Clicking on the play a game link should direct users to a list of existing games
    Given that I am on the home page
    Then I should see "Play a giving game" 
    When I click on "Play a giving game"
    Then I should be on the existing games page

  Scenario: Clicking on the create a new game link should direct users to a page with the option to start a new game
    Given that I am on the home page
    Then I should see "Create a new giving game" 
    When I click on "Create a new giving game"
    Then I should be on create new game page
