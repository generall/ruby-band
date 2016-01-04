Feature: Creation of an in-memory dataset
	In order to perform calculations on a dataset
	I want to easily build it and store it in memory

	Scenario: creation of a dataset
		Given a nominal attribute, named "assertion", with values "yes,no" 
		And a numeric attribute, named "temperature"
		And a string attribute, named "days"
		And two data rows: "yes,100,Mon","no,100,Thu"
		Then I want to build an empty dataset for my use
		And I want to populate the dataset by row
		And I want to print my dataset as a bidimensional Ruby Array
        And the dataset's attributes should have the defined types
