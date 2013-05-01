require 'rcal.rb'

month = ARGV[0]
year = ARGV[1]

cal = RubyCal.new(month, year)
print cal.render
STDOUT.flush
