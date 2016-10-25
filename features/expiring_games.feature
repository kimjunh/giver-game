Feature: Make Games End
  As a user of the site who creates games
  So that games don’t exist past their expiration date or use more total money than I want
  I want to set expiration dates and money limits for games that control when they end

  Background:
    Given I am on the home page
    And the following games exist:
    | title        | id | description                                 | charityA_title | charityB_title | expired | expiration_time          | total_money | per_transaction  | votesA | resource_id |   
    | Expirein     |  1 | 'This game should expire'                   | Charity A      | Charity B      | true    |                          | 100         | 1                |        | 1           |
    | Expire2      |  2 | 'This game should also expire'              | Charity 1      | Charity 2      | false   | 2016-04-20 01:00:00 UTC  | 100         | 1                |        | 2           |
    | Expire3      |  3 | 'This game should also expire too'          | Charity 4      | Charity 5      | false   |                          | 100         | 1                | 99     | 3           |
    And the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE  | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

  Scenario: Should not be able to play a game that is expired
    When I follow "Play a giving game"
    Then I should not see "Expirein"
    And I should not see "Expire2"
    
  Scenario: Create a game with an expiration field
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page 
    Then I should see "Expiration Date"
    And I should see "Goal Amount of Money to Reach"
  
  Scenario: If the vote limit is reached, the game should not be played
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I follow "Expire3" in my table
    And I press "Donate to Charity 4"
    Then I should not see "Expire3"
