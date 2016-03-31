Feature: Play and choose from multiple tutorials
  As a new user
  So that I can see and learn from different examples of giving games
  I would like to see and pick from a menu of Tutorial games
  
    Scenario: Select and play from multiple tutorials
      Given I am on the home page
      When I choose "Tutorial" from the dropdown menu in the navbar
      And I press "Go"
      Then The tutorial titled "Tutorial" should be there
      Given I am on the home page
      When I choose "Tutorial 2" from the dropdown menu in the navbar
      And I press "Go"
      Then The tutorial titled "Tutorial 2" should be there



