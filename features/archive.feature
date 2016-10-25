Feature: Archive
  As a user of the site who creates games
  So that I can look at old games as examples
  I want to be able to view the archive of expired giving games
  
  Background: Games exist
    Given I am on the home page
    And the following games exist:
    | title                   | description                                 | charityA_title | charityB_title | votesA | votesB | show_results | expired | resource_id |
    | Tutorial                | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | 0      | 100    | true         | true    | 1           |
    | NoShow                  | 'This is a game without showing results on' | Charity A      | Charity B      | 100    | 0      | false        | true    | 2           |
    
  Scenario: Should see expired games on the archive page
    When I follow "View Expired Games"
    Then I should be on the archive page
    And I should see "Tutorial" in my table
    And I should see "NoShow" in my table

  Scenario: Clicking on an expired game with show_results set to false 
    When I follow "View Expired Games"
    And I follow "NoShow" in my table
    Then I should be on the expired game info page for "NoShow"
    And I should see "This is a game without showing results on"
    And I should not see "See Results for this Giving Game"

  Scenario: Clicking on an expired game with show_results set to true
    When I follow "View Expired Games"
    And I follow "Tutorial" in my table
    Then I should be on the expired game info page for "Tutorial"
    And I should see "This is the tutorial for the Giving Game"
    And I should see "See Results for this Giving Game"

    