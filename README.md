# QA Code Test

### Setup
1. Download and unzip file
2. Rename your project "qa-interview-yourname"
3. Make sure your Ruby environment is using `ruby 2.3.3`
4. Be sure to bundle install
5. Run the example feature file:
    - `bundle exec cucumber features/example.feature`
6. Create the tests below in order.  You should be able to create any tests by building on the
   files that are already set up in the project.

Homepage='https://www.name-generator.org.uk/fantasy/'

### Tests
Write automated test scenarios to validate each of the following:
1. That you are on the expected page for the Fantasy Name Generator
2. Select only one category and submit the form
3. Validate that the selected category from scenario 2 is present in each entry of the list of names
4. Use the "Suggest" button and validate that a human name has been added to the human name input field. Submit the form.
5. Validate that the suggested human name (either first or last name) from scenario 4 is present at least once in the list of names
6. Submit the form with a specified number of names and validate that the correct number of suggestions populates