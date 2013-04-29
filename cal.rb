month = ARGV[0]
year = ARGV[1]

class RubyCal
  attr_reader :month
  attr_reader :year
  attr_reader :lo_month
  attr_reader :year_type
  attr_reader :days
  attr_reader :starting_day

  def initialize (month, year)
    @month = month
    @year = year

    if (year%400 == 0)
      @year_type = "Leap"
    elsif (year%100 == 0)
      @year_type = "Normal"
    elsif (year%4 == 0)
      @year_type = "Leap"
    else
      @year_type = "Normal"
    end

    case month
      when 1
        @lo_month, @days = "January", 31
      when 2
        @lo_month = "February"
        @days = 28 if @year_type == "Normal"
        @days = 29 if @year_type == "Leap"
      when 3
        @lo_month, @days = "March", 31
      when 4
        @lo_month, @days = "April", 30
      when 5
        @lo_month, @days = "May", 31
      when 6
        @lo_month, @days = "June", 30
      when 7
        @lo_month, @days = "July", 31
      when 8
        @lo_month, @days = "August", 31
      when 9
        @lo_month, @days = "September", 30
      when 10
        @lo_month, @days = "October", 31
      when 11
        @lo_month, @days = "November", 30
      when 12
        @lo_month, @days = "December", 31
      end
  end

  def month_year
    "#{@lo_month} #{@year}".center(20).rstrip
  end

  def day_names
    "Su Mo Tu We Th Fr Sa"
  end

  def starting_day
    d, m, y = 1, @month, @year
    #transmute month and year to zeller style
    m = (m += 9) % 12
    y -= m / 10
    #now the formula
    (d + ((m + 1) * 26 / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
  end

end

RubyCal.new("#{month}", "#{year}")



