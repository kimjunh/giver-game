Feature: Create user accounts
  As an administrator on the website
  So that I can allow users to have personal content on the website
  I want to have account functionality on the website
  
  Background: Users exist
    
    Given the following users exist:
      | username | password |     email             |
      | Daniel   | lol      |  daniel@gmail.com     |
    
  #Happy Path!
  Scenario: Create a user account
    When I am on the home page
    And I go to the new user page
    And I fill in "Username" with "Rohin"
    And I fill in "Password" with "ppaasssswwoorrdd"
    And I fill in "Email" with "rohinshah@gmail.com"
    And I press "Create New User"
    Then I should be on the user page for "Rohin"
    And I should see "Welcome, Rohin!"
    
  #Sad Path.
  Scenario: Attempt to create a user account with already existing username
    When I am on the home page
    And I go to the new user page
    And I fill in "Username" with "Daniel"
    And I fill in "Password" with "nope"
    And I fill in "Email" with "email@gmail.com"
    And I press "Create New User"
    Then I should be on the new user page
    And I should see "Username is already taken."
  
  #Sad Path
  Scenario: Attempt to create a user account with already existing password
    When I am on the home page
    And I go to the new user page
    And I fill in "Username" with "DragonSlayer"
    And I fill in "Password" with "destructi0n"
    And I fill in "Email" with "daniel@gmail.com"
    And I press "Create New User"
    Then I should be on the new user page
    And I should see "Email is already taken."
    