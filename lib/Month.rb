class Month
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def long_month_name
    month_names = %w(January February March April May June July August September October November December)
    month_names[@month - 1]
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

    until wk_num_arr.length == 42 #6 weeks x 7 days
      wk_num_arr.push "\s\s"
    end

    days_by_week_array = []
    6.times do |k|
      days_by_week_array << (wk_num_arr[k*7, 7].join("\s"))
    end

    days_by_week_array #the array with 6 week rows
  end

  def return_month
    modified_week_numbers = week_numbers.collect{|e| e.rstrip}
    "#{month_year}\n#{week_days}\n#{modified_week_numbers.join("\n")}\n"
  end

  def year_view_array
    line_arr = []
    line_arr << "#{long_month_name}".center(20)
    line_arr << week_days
    line_arr.concat(week_numbers)
  end

end
