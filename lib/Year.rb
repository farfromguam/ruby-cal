# require 'Month.rb'

class Year
  # attr_reader :year

  def initialize(year)
    @year = year
  end

  def banner
    "#{@year}".center(62).rstrip
  end

  def convert(month, year)
    month = Month.new(month, year)
    month.year_view_array
  end

  def assemble(one, two, three)
    raw_zip = convert(one, @year).zip convert(two, @year), convert(three, @year)
    raw_zip.collect { |x| x.join("\s\s").rstrip }.join("\n")
  end

  def return_year
    "#{banner}\n\n#{assemble(1,2,3)}\n#{assemble(4,5,6)}\n#{assemble(7,8,9)}\n#{assemble(10,11,12)}"
  end

end