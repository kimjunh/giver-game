Feature: Play a tutorial
  As a new user who wants to play
  I want to be able to learn how to play the giving game through the tutorial
  So that I can understand the concept of the game and start donating
  
  Background: tutorial exists 
    Given I am on the home page
    And the following games exist:
    | title                   | description                                 | charityA_title | charityB_title |
    | Tutorial                | 'This is the tutorial for the Giving Game'  | Charity A      | Charity B      | 
  
  Scenario: Go to the tutorial page
    When I follow "Play Tutorial"
    Then I should be on the tutorial page

  Scenario: Play the sample game
    When I follow "Play Tutorial"
    And I press "Donate to Charity A"
    Then I should be on the tutorial results page
    And I should see "You have successfully donated!"
