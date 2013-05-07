require 'lib/Month.rb'
require 'lib/Year.rb'

month = ARGV[0]
year = ARGV[1]

if month == "all"
    year = Year.new(year.to_i)
    puts year.return_year
else
    cal = Month.new(month.to_i, year.to_i)
    puts cal.return_month
end



# year and month parser
    # if month.class == String
    #   case month.downcase
    #   when "jan", "january"
    #     month = 1
    #   when "feb", "february"
    #     month = 2
    #   when "mar", "march"
    #     month = 3
    #   when "apr", "april"
    #     month = 4
    #   when "may"
    #     month = 5
    #   when "jun", "june"
    #     month = 6
    #   when "jul", "july"
    #     month = 7
    #   when "aug", "august"
    #     month = 8
    #   when "sep", "sept", "september"
    #     month = 9
    #   when "oct", "october"
    #     month = 10
    #   when "nov", "november"
    #     month = 11
    #   when "dec", "necember"
    #     month = 12
    #   else
    #     month = month.to_i
    #   end
    # end

    # if month.class == Fixnum && (1..12) === month
    #   @month = month
    # else
    #   raise ArgumentError, "Cannot parse month"
    # end

    # if (1800..3000) === y
    #   @year = y
    # elsif (00..99) === y
    #   @year = 2000 + y
    # else
    #   raise ArgumentError, "Year out of range"
    # end