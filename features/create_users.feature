Feature: Create user accounts
  As an administrator on the website
  So that I can allow users to have personal content on the website
  I want to have account functionality on the website
  
  Background: Users exist
    
    Given the following users exist:
      | uid      | password | password_confirmation|     email             |
      | Daniel   | lollolol |  lollolol            |  daniel@gmail.com     |
    
  #Happy Path!
  Scenario: Create a user account
    When I am on the home page
    And I go to the sign in page
    And I go to the sign up page
    And I fill in "user[uid]" with "Rohin"
    And I fill in "user[password]" with "ppaasssswwoorrdd"
    And I fill in "user[password_confirmation]" with "ppaasssswwoorrdd"
    And I fill in "user[email]" with "rohinshah@gmail.com"
    And I press "submit"
    Then I should be on the home page
    And I should see "Welcome! You have signed up successfully."
  
  #Sad Path
  Scenario: Attempt to create a user account with already existing email
    When I am on the home page
    And I go to the sign in page
    And I go to the sign up page
    And I fill in "user[uid]" with "DragonSlayer"
    And I fill in "user[password]" with "destructi0n"
    And I fill in "user[password_confirmation]" with "destructi0n"
    And I fill in "user[email]" with "daniel@gmail.com"
    And I press "submit"
    And I should see "Email has already been taken"
  
  #Sad Path
  Scenario: Attempt to create a user account with empty password
    When I am on the home page
    And I go to the sign in page
    And I go to the sign up page
    And I fill in "user[uid]" with "DragonRider"
    And I fill in "user[email]" with "rydah@gmail.com"
    And I press "submit"
    And I should see "Password can't be blank"