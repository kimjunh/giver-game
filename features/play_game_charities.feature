Feature: Seeing Charities on the Play game
  As a user who is playing giving games
  So that I can understand the difference between the charities I’m voting for
  I want to be able to see their description etc. on the play games page
  
  Background: game exists
    Given I am on the existing games page
    And the following games exist:
    | Game one                | This is a game for C 1 & 2                  | Charity 1      | Charity 2      |
    | Game two                | This is a game for C 3 & 4                  | Charity 3      | Charity 4      | 
    | Game three              | This is a game for C 5 & 6                  | Charity 5      | Charity 6      |

 Scenario: Become informed about each charity in the game
    When I follow "Game one"
    Then I should be on the game page for "Game one"
    And I should see "Description for Charity 1"
    And I should see "Description for Charity 2"
    
   