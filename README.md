NSS-Cal
===============

This is the exercise for week 3

Instructions
-----------

Print out any month between 1800-3000

like command "cal" in unix

Issues:
- Leap Years
- # of days in each month
- Days of the week
- Justifying text
- What day of the week does the month start on


Delivery:
ruby cal.rb <month> <year>

Tests:
1.) Integration Tests

Output of cal == my cal

asseert_equal(`cal 2 2012, `ruby cal.rb 2 2012`)

Step 0)
Create a Git repository (copy in the test unit used for LinkedLists) where rake will run.

Step 1)
Create Integration tests
asseert_equal(`cal 2 2012, `ruby cal.rb 2 2012`)

Step 2)
Submit link to integration tests in Canvas

TaskList:
- Method to, format the Header (month and year)
- Method to, returns days of the week
- Method to,