Feature: Edit existing giving games
  As a user who made a giving game
  So that I can provide new updated information on my existing and current giving games
  I want to be able to edit my giving game
  
  Background: Users with games exist
    
    Given some games and some users exist:
    
    #Happy Path
    Scenario: Edit a game
      Given I am logged in as "j0e@tr8er.org"
      When I am on the user page for "j0e@tr8er.org"
      And I go to the edit page for "Game 1"
      And I fill in "Title" with "Game 1000"
      And I press "Finish"
      And I should see "Successfully edited."
      
    #Sad Path
    Scenario: Attempt to edit a game
      Given I am logged in as "j0e@tr8er.org"
      When I am on the user page for "j0e@tr8er.org"
      And I go to the edit page for "Game 1"
      And I fill in "Title" with "Game 2"
      And I press "Finish"
      And I should see "The title Game 2 is already taken."