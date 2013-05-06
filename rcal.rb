class RubyCal
  attr_reader :month
  attr_reader :year

  def initialize (m, y)

    if m.class == String
      case m.downcase
        when "jan", "january"
          m = 1
        when "feb", "february"
          m = 2
        when "mar", "march"
          m = 3
        when "apr", "april"
          m = 4
        when "may"
          m = 5
        when "jun", "june"
          m = 6
        when "jul", "july"
          m = 7
        when "aug", "august"
          m = 8
        when "sep", "sept", "september"
          m = 9
        when "oct", "october"
          m = 10
        when "nov", "november"
          m = 11
        when "dec", "necember"
          m = 12
        else
          m = m.to_i
        end
    end

    if m.class == Fixnum && (1..12) === m
      @month = m
    else
      raise ArgumentError, "Cannot parse month"
    end

    y = y.to_i

    if (1800..3000) === y
      @year = y
    elsif (00..99) === y
      @year = 2000 + y
    else
      raise ArgumentError, "Year out of range"
    end

  end

  def long_month_name
    month_names = {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'April',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'October',
      11 => 'November',
      12 => 'December'
    }

    month_names[@month]
  end

  def is_leap_year?
    if (@year%400 == 0)
      true
    elsif (@year%100 == 0)
      false
    elsif (@year%4 == 0)
      true
    else
      false
    end
  end

  def starting_day
    m, y = @month, @year

    if (m == 1) || (m == 2)
      m = m + 12
      y = y - 1
    end

    (((m + 1) * 26 / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
  end

  def days_in_month
    case @month
      when 1,3,5,7,8,10,12
        31
      when 2
        is_leap_year? ? 29 : 28
      else
        30
      end
  end

  def month_year
    "#{long_month_name} #{@year}".center(20).rstrip
  end

  def week_days
    "Su Mo Tu We Th Fr Sa"
  end

  def week_numbers
    wk_num_arr = ("01".."#{days_in_month}").to_a

    wk_num_arr.each do |i|
      i.gsub!(/0/, "\s") if i < "10"
    end

    starting_day.times do
      wk_num_arr.unshift "\s\s"
    end

    until wk_num_arr.length == 42
      wk_num_arr.push "\s\s"
    end

    chunks = []
    6.times do |x|
      chunks << (wk_num_arr[x*7, 7].join("\s"))
    end

    chunks
  end

  def render
    naked_weeks = week_numbers.collect{|e| e.rstrip}
    "#{month_year}\n#{week_days}\n#{naked_weeks.join("\n")}\n"
  end

  def year_view_array
    line_arr = []
    line_arr << "#{long_month_name}".center(20)
    line_arr << week_days
    line_arr.concat(week_numbers)
  end

end
