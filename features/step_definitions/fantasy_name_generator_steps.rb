# should each individual scenario have its own file?
# are the Regex escape characters necessary or best practice?
# how robust should sad path testing be? every test?
# each scenario should only have one 'given' and 'when' ?
# generates suggestions in my terminal without use of 'And' keyword

# That you are on the expected page for the Fantasy Name Generator
Given(/^I travel to the Fantasy Name Generator page$/) do
  visit "https://www.name-generator.org.uk/fantasy/"
end

#can use has_current_path? also
Then(/^I expect to be on the Fantasy Name Generator page$/) do
  page.assert_current_path("https://www.name-generator.org.uk/fantasy/")
end

# Submit the form with a specified number of names and validate that the correct number of suggestions populates
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

# Select only one category and submit the form
# Validate that the selected category from scenario 3 is present in each entry of the list of names

#Don't think this validation is working
And("I see that all names are checked") do
  # element = find("fantasy_types[]['Centaur']")
  # element.checked?

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
  # within('.fantasy_checkbox_div_wrapper') do
  page.check('fantasy_types[]', option: 'Centaur')
    # find(:css, ".fantasy_checkbox_div[value='Centaur']").set(true)
    # within('.fantasy_checkbox_div').first do
    #   page.check
    #   # page.find('#fantasy_types').all('.fantasy_checkbox_div')[0].set(true)
    # end
  # end
end

And("I input a number within specified range of examples I would like to generate") do
  fill_in 'count', with: 11
end

#not hardcoding the selected category into the test to make it more dynamic?
Then("I should see names generated only belonging to that category of names") do
  all('.name').each do |name|
    within('.name_heading') do
      name.has_content?('centaur')
    end
  end
end

# Use the "Suggest" button and validate that a human name has been added to the human name input field. Submit the form.
# Validate that the suggested human name (either first or last name) from scenario 5 is present at least once in the list of names

When("I click on the Suggest button to generate a random first and last name I see a name in the box") do
  click_on 'Suggest'

  random_name = page.find('.sizeMedium')
  random_name.value.length != 0
end

Then("I should see names generated incorporating the suggested first or last name at least once.") do
  random_first_name = page.find('h1', text: '').text.split.last(2).first.to_s
  random_last_name = page.find('h1', text: '').text.split.last(2).last.to_s
    all('.name_heading').each do |name_heading|
      name_heading.text.include?(random_first_name)
      name_heading.text.include?(random_last_name)
    end
end
