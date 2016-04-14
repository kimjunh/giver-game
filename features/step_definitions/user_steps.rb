Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    User.create!(user)
  end
end

Given(/^some games and some users exist:$/) do
  games = [{:title => 'Game 1', :description =>'This is game', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false, :user_id => 1},
        {:title => 'Game 2', :description =>'This is not a tutorial', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false, :user_id => 1}]
  games.each do |game|
      GivingGame.create!(game)
  end
  user = User.create! :email => 'j0e@tr8er.org', :password => 'TRAITORJOE', :password_confirmation => 'TRAITORJOE', :uid => 'Traitor_JOSEPHINE', :giving_games => GivingGame.all, :id => 1
end

Given(/^I am logged in as "([^"]*)"$/) do |arg1|
  step "I go to the sign in page"
  step "I fill in \"user_email\" with \"j0e@tr8er.org\""
  step "I fill in \"user_password\" with \"TRAITORJOE\""
  step "I press \"log-in\""
  step "I should see \"Signed in successfully.\""
end

