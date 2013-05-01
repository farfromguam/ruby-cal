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

Integration Tests:
asseert_equal(`cal 2 2012, `ruby cal.rb 2 2012`)


Things I still need to do
-------------------------

- Restrict year input to between 1800-3000


Things I would like to do
-------------------------

Input Options:
- Accept no arguments, and get current month
- Accept month names as arguments
- Accept short month names as arguments
- Accept partial year and assume century

Display Features:
- Accept only year, Print whole Year
- Accept range of months and print range