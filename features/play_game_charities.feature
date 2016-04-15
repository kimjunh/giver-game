Feature: Seeing Charities on the Play game
  As a user who is playing giving games
  So that I can understand the difference between the charities I’m voting for
  I want to be able to see their description etc. on the play games page
  
  Background: game exists
    Given I am on the home page
    And the following games exist:
    | title                   | charityA_title | charityB_title | descriptionA                | descriptionB                |
    | Game one                | Charity 1      | Charity 2      | 'bloop'                     | 'blop'                      |
    | Game two                | Charity 3      | Charity 4      | 'Description for Charity 3' | 'Description for Charity 4' |
    | Game three              | Charity 5      | Charity 6      | 'Description for Charity 5' | 'Description for Charity 6' |

 Scenario: Become informed about each charity in the game
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game one" in my table
    When I follow "Game one" in my table
    Then I should be on the game page for "Game one"
    Then I should see "bloop"
    Then I should see "blop"
    
   