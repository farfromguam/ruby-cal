class RubyCal
  attr_reader :month
  attr_reader :year
  attr_reader :year_type
  attr_reader :starting_day
  attr_reader :week_numbers
  attr_reader :render

  def initialize (month, year)
    @month = month.to_i
    @year = year.to_i
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

  def banner
    month_year = "#{long_month_name} #{@year}".center(20).rstrip
    return "#{month_year}\nSu Mo Tu We Th Fr Sa\n"
  end

  def starting_day
    d, m, y = 1, @month, @year
    #transmute month and year to zeller style
    m = (m += 9) % 12
    y = y - (m / 10)
    #now the formula
    (d + ((m + 1) * 26 / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
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

  def week_numbers
    #assemble into array
    wk_num_arr = ("01".."#{days_in_month}").to_a
    starting_day.times do
      wk_num_arr.unshift "\s\s"
    end

    #insert new line every 7
    i = 1
    x = wk_num_arr.length / 7
    x.times do
      wk_num_arr.insert((i*8)-1, "NL")
      i += 1
    end

    #make up diffrence for a total of 5 new line
    (6 - x).times do
      wk_num_arr.push "NL"
    end

    #manupulate as string
    wk_num_str = wk_num_arr.join("\s")
    wk_num_str.gsub!(/\s0/, "\s\s")
    wk_num_str.gsub!(/01/, "\s1")
    wk_num_str.gsub!(/\sNL\s/, "NL")
    wk_num_str.gsub!(/\sNL/, "NL")
    wk_num_str.gsub!(/NL/, "\n")

    return wk_num_str
  end

  def render
    return "#{banner}#{week_numbers}"
  end

end

