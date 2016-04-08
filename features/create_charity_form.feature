Feature: Adding Charity Fields to Forms
  As a user who wants to create giving games
  So that I can provoke critical thinking about charities
  I want to have more fields to add images and descriptions for charities
  
  Scenario: Create a giving game with descriptions for each charity
    When I am on the new games page
    When I fill out the form
    And I fill in "Description A" with "Description 1."
    And I fill in "Description B" with "Description 2."
    And I upload an image to the form
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game First Game successfully created."
    
  Scenario: Create a giving game with empty descriptions for each charity
    When I am on the new games page
    When I fill out the form without descriptions
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "Some fields are empty or invalid: Description A, Description B"
    