Feature: Make Games End
  As a user of the site who creates games
  So that games don’t exist past their expiration date or use more total money than I want
  I want to set expiration dates and money limits for games that control when they end

  Background:
    Given I am on the home page:
    And the following games exist:
    | title        | id | description                                 | charityA_title | charityB_title | expire |
    | Expirein     |  1 | 'This game should expire'                   | Charity A      | Charity B      | true   |
    And the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE  | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

  Scenario: Should not be able to play a game that is expired
    When I follow "Play a giving game"
    Then I should not see "Expirein"
    
  Scenario: Create a game with an expiration field
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page 
    Then I should see "Expiration Date"
    And I should see "Money Limit"
  