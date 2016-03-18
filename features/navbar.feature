Feature: Navbar
  As a user seeking direction
  So that I can easily navigate through the site
  I want to be able to see different parts of the site and navigate quickly through a navbar
  
Scenario: I should see all three links
  When I am on the Create New Game page
  Then I should see: "Home", "Create New Game", "Play Tutorial", "Play Game"
  
Scenario: Navigate to the home page
  Given I am on the Create New Game page
  When I follow "Home"
  Then I should be on the home page
  
Scenario: Navigate to the Create New Game page
  Given I am on the home page
  When I follow "Create New Game"
  Then I should be on the Create New Game page
  
Scenario: Navigate to the Play Game page
  Given I am on the home page
  When I follow "Play Game"
  Then I should be on the game index page
  