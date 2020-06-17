Feature: Fantasy Name Generator

Scenario: View Fantasy Name Generator home page
  Given   I travel to the Fantasy Name Generator page
  Then    I expect to be on the Fantasy Name Generator page


Scenario: Submit form with specific number of names and generate that amount of names
  Given   I am on the Fantasy Name Generator page
  When    I input a number within specified range of examples of each type I would like to generate
  And     I click the write me some fantasy names button
  Then    I should see the same number of names generated that I put into the form

Scenario: Select only one category and submit the form
  Given   I am on the Fantasy Name Generator page
  And     I see that all names are checked
  When    I click on button to uncheck all boxes
  And     I check only one box
  And     I input a number within specified range of examples I would like to generate
  Then    I should see names generated only belonging to that category of names

Scenario: Use the suggest button to generate fantasy names using the random name
  Given   I am on the Fantasy Name Generator page
  When    I click on the Suggest button to generate a random first and last name I see a name in the box
  And     I click the write me some fantasy names button
  Then    I should see names generated incorporating the suggested first or last name at least once.
