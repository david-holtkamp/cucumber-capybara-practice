# Scenario: View Fantasy Name Generator home page
Given(/^I travel to the Fantasy Name Generator page$/) do
  visit "https://www.name-generator.org.uk/fantasy/"
end

Then(/^I expect to be on the Fantasy Name Generator page$/) do
  page.assert_current_path("https://www.name-generator.org.uk/fantasy/")
end

# Scenario: Submit form with specific number of names and generate that amount of names
Given("I am on the Fantasy Name Generator page") do
  visit "https://www.name-generator.org.uk/fantasy/"
end

When("I input a number within specified range of examples of each type I would like to generate") do
  fill_in 'count', with: 11
end

And("I click the write me some fantasy names button") do
  click_on 'Write me some fantasy names'
end

Then("I should see the same number of names generated that I put into the form") do
  page.has_text?('Name Generator')
  page.has_css?('.name', count: 11)
end

# Scenario: Select only one category and submit the form
# pulling the 'given' from previous scenario
And("I see that all names are checked") do
  within('.fantasy_checkbox_div_wrapper') do
    all('.fantasy_checkbox_div').each do |checkbox|
      checkbox.checked?
    end
  end
end

When("I click on button to uncheck all boxes") do
  click_on 'Uncheck all'
end

And("I check only one box") do
  page.check('fantasy_types[]', option: 'Centaur')
end

And("I input a number within specified range of examples I would like to generate") do
  fill_in 'count', with: 11
end

Then("I should see names generated only belonging to that category of names") do
  all('.name').each do |name|
    within('.name_heading') do
      name.has_content?('centaur')
    end
  end
end

# Scenario: Use the suggest button to generate fantasy names using the random name
# pulling the 'given' from previous scenario
When("I click on the Suggest button to generate a random first and last name I see a name in the box") do
  click_on 'Suggest'

  random_name = page.find('.sizeMedium')
  random_name.value.length != 0
end

# pulling the write me some fantasy names button click from previous scenario

Then("I should see names generated incorporating the suggested first or last name at least once.") do
  random_first_name = page.find('h1', text: '').text.split.last(2).first.to_s.downcase
  random_last_name = page.find('h1', text: '').text.split.last(2).last.to_s.downcase
    all('.name_heading').find do |name_heading|
      name_heading.text.include?(random_first_name) || name_heading.text.include?(random_last_name)
    end
end
