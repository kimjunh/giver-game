Feature: Create a new game
  As a user of this great site
  I want to be able to create a new giving game
  So that I can start my own giving game with my selected charities

Background:

  Given the following games exist:
  | title       | description                                | per_transaction | charityA_title | charityB_title |
  | First game  | something something                        |      10         | A charity      | what           |
  | Second game | something something else                   |      1          | Another one    | cold           |

  Given the following users exist:
  | username           | password   | password_confirmation  |     email             |
  | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

  Scenario: Create the first game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill in "Title" with "First Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Description A" with "Provides money to Syrians displaced by the civil war."
    And I fill in "Charity B" with "Trump Refugees"
    And I fill in "Description B" with "Donates directly to people leaving America because of Trump's policies"
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game First Game successfully created."
  
  Scenario: Create the second game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill in "Title" with "Second Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "500"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Give Directly"
    And I fill in "Description A" with "Provides money directly to groups of impoverished people."
    And I fill in "Charity B" with "Malaria Nets"
    And I fill in "Description B" with "Provides malaria nets to locals."
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game Second Game successfully created."

  Scenario: Check for both games in the index page
    When I am on the existing games page
    Then I should see: "First game", "Second game", "$10", "$1"
    Then I should see only "2" games
    
  Scenario: Forms should show errors for blank inputs
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "There were the following errors"
    
  Scenario: Forms should not allow alphabet values for Money
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill in "Title" with "Second game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "Money"
    And I fill in "AmountPerVote" with "Munnay"
    And I fill in "Charity A" with "Give Directly"
    And I fill in "Description A" with "Provides money directly to groups of impoverished people."
    And I fill in "Charity B" with "Malaria Nets"
    And I fill in "Description B" with "Provides malaria nets to locals."
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "There were the following errors"

  Scenario: Forms should not allow non-numeric symbols for Money
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill in "Title" with "Second game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "^*(#"
    And I fill in "AmountPerVote" with "[]@)$0_"
    And I fill in "Charity A" with "Give Directly"
    And I fill in "Description A" with "Provides money directly to groups of impoverished people."
    And I fill in "Charity B" with "Malaria Nets"
    And I fill in "Description B" with "Provides malaria nets to locals."
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "There were the following errors"

  Scenario: Forms should not allow negative value for Money
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill in "Title" with "Second game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "-1000"
    And I fill in "AmountPerVote" with "-100000"
    And I fill in "Charity A" with "Give Directly"
    And I fill in "Description A" with "Provides money directly to groups of impoverished people."
    And I fill in "Charity B" with "Malaria Nets"
    And I fill in "Description B" with "Provides malaria nets to locals."
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "There were the following errors"

  Scenario: Try creating another game with same name
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill in "Title" with "First game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Charity B" with "Trump Refugees"
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "There were the following errors"
    
  Scenario: Cannot create a new game when not logged in
    Given I am on the home page
    When I follow "Create a new giving game"
    Then I should be on the sign in page
    And I should see "You must be logged in to create a new giving game"

