Given /the following games exist/ do |games_table|
  games_table.hashes.each do |game|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    GivingGame.create!(game)
  end
end

When(/^I choose "([^"]*)" from the dropdown menu in the navbar$/) do |tutorial|
  select tutorial, :from => "navbar_select"
end

Then(/^The tutorial titled "([^"]*)" should be there$/) do |tutorial|
  step "I should see \"#{tutorial}\""
end