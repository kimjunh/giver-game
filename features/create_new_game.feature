Feature: Create a new game
  As a user of this great site
  I want to be able to create a new giving game
  So that I can start my own giving game with my selected charities

Background: tutorial exists 

  Given the following games exist:
  | title       | description                                | per_transaction | charityA_title | charityB_title |
  | First game  | something something                        |      10         | A charity      | what           |
  | Second game | something something else                   |      1          | Another one    | cold           |

  Scenario: Create the first game
    When I am on the Create New Game page
    And I fill in "Title" with "First game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Charity B" with "Trump Refugees"
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "First game successfully created"
  
  Scenario: Create the second game
    When I am on the Create New Game page
    And I fill in "Title" with "Second game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "500"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Charity B" with "Trump Refugees"
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Second game successfully created"

  Scenario: Check for both games in the index page
    When I am on the existing games page
    Then I should see: "First game", "Second game", "$10", "$1"
    Then I should see only "2" games
    