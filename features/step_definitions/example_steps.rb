Given(/^I am on the fantasy name page$/) do
  find('h2', :text => "Name Generator")
end

Then(/^I see the text "(.*?)"$/) do |text|
  page.has_text?(text)
end
