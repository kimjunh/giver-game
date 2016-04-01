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

Then /^I should see "(.*)" in my table$/ do |game|
  table_results = page.find('table.games')
  table_results.should have_content(game)
end

    