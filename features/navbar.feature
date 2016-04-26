Feature: Navbar
  As a user seeking direction
  So that I can easily navigate through the site
  I want to be able to see different parts of the site and navigate quickly through a navbar

Background:
  Given the following users exist:
  | username            | password   | password_confirmation  |     email             |
  | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |
  
Scenario: I should see all three links
  When I am on the new games page
  Then I should see: "Home", "Create New Game", "Play Tutorial", "Play Game"
  
Scenario: Navigate to the home page
  Given I am on the new games page
  When I follow "Home"
  Then I should be on the home page
  
Scenario: Navigate to the Create New Game page
  Given I am on the home page
  Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
  When I follow "Create New Game"
  Then I should be on the new games page
  
Scenario: Navigate to the Play Game page
  Given I am on the home page
  When I follow "Play Game"
  Then I should be on the existing games page
  
