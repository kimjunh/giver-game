Then(/^I should see: "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  step "I should see \"#{arg1}\""
  step "I should see \"#{arg2}\""
  step "I should see \"#{arg3}\""
  step "I should see \"#{arg4}\""
end

Then(/^I should see only "([^"]*)" games$/) do |arg1|
  step "I should see \"Total Number of Games: #{arg1}\""
end

When /^I follow "(.*)" in my table$/ do |game|
  within('table.games') do
    click_link game
  end
end

When /^I fill out the form$/ do
  steps %Q{
    And I fill in "Title" with "First Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Description A" with "Provides money to Syrians displaced by the civil war."
    And I fill in "Charity B" with "Trump Refugees"
    And I fill in "Description B" with "Donates directly to people leaving America because of Trump's policies"
  }
end

When /^I fill out the form without descriptions$/ do
  steps %Q{
    And I fill in "Title" with "First Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Charity B" with "Trump Refugees"
  }
end

When /^I upload an image to the form$/ do
  attach_file(:png_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'img_1.csv'))
  click_button "Attach image"
end

Then /^I should see "(.*)" in my table$/ do |game|
  table_results = page.find('table.games')
  table_results.should have_content(game)
end

    