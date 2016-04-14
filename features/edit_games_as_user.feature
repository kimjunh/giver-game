Feature: Edit existing giving games
  As a user who made a giving game
  So that I can provide new updated information on my existing and current giving games
  I want to be able to edit my giving game
  
  Background: Users with games exist
    
    Given the following users exist:
      | username    |     email             |     giving_game_titles               |
      | Trader Joe  |  j0e@tr8er.org        |         "Game 1", "Game 2"           |
    
    #Happy Path
    Scenario: Edit a game
      When I am on the user page for "Trader Joe"
      And I go to the games of user page for "Trader Joe"
      And I go to the edit page for "Game 1"
      And I fill in "Title" with "Game 1000"
      And I press "Finish"
      Then I should be on the games of user page for "Trader Joe"
      And I should see "Successfully edited."
      
    #Sad Path
    Scenario: Attempt to edit a game
      When I am on the user page for "Trader Joe"
      And I go to the games of user page for "Trader Joe"
      And I go to the edit page for "Game 1"
      And I fill in "Title" with "Game 2"
      And I press "Finish"
      Then I should be on the games of user page for "Trader Joe"
      And I should see "The title Game 2 is already taken."