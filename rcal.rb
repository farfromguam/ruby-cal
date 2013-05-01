class RubyCal
  attr_reader :month
  attr_reader :year
  attr_reader :l_2
  attr_reader :l_3
  attr_reader :l_4
  attr_reader :l_5
  attr_reader :l_6
  attr_reader :l_7

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

    #also run this...
    week_numbers

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

  def m_y
    "#{long_month_name} #{@year}".center(20).rstrip
  end

  def l_0
    "#{long_month_name}".center(20)
  end

  def l_1
    "Su Mo Tu We Th Fr Sa"
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

#----------Old Code-------------------

  # def week_numbers
  #   #assemble into array
  #   wk_num_arr = ("01".."#{days_in_month}").to_a
  #   starting_day.times do
  #     wk_num_arr.unshift "\s\s"
  #   end

  #   #insert new line every 7
  #   i = 1
  #   x = wk_num_arr.length / 7
  #   x.times do
  #     wk_num_arr.insert((i*8)-1, "NL")
  #     i += 1
  #   end

  #   #make up diffrence for a total of 6 newlines
  #   (6 - x).times do
  #     wk_num_arr.push "NL"
  #   end

  #   #manupulate as string
  #   wk_num_str = wk_num_arr.join("\s")
  #   wk_num_str.gsub!(/\s0/, "\s\s")
  #   wk_num_str.gsub!(/01/, "\s1")
  #   wk_num_str.gsub!(/\sNL\s/, "NL")
  #   wk_num_str.gsub!(/\sNL/, "NL")
  #   wk_num_str.gsub!(/NL/, "\n")

  #   return wk_num_str
  # end

  # def render
  #   return "#{banner}#{week_numbers}"
  # end

#----------------------------------

  def week_numbers
    #assemble into array
    wk_num_arr = ("01".."#{days_in_month}").to_a

    #add blanks at the beginning
    starting_day.times do
      wk_num_arr.unshift "\s\s"
    end

    #add blanks at end until total is 42
    until wk_num_arr.length == 42
      wk_num_arr.push "\s\s"
    end

    #strip out leading 0's
    wk_num_arr.each do |i|
      i.gsub!(/0/, "\s") if i < "10"
    end

    #chunk into blocks of 7
    wk_line_2 = wk_num_arr[0, 7]
    wk_line_3 = wk_num_arr[7, 7]
    wk_line_4 = wk_num_arr[14, 7]
    wk_line_5 = wk_num_arr[21, 7]
    wk_line_6 = wk_num_arr[28, 7]
    wk_line_7 = wk_num_arr[35, 7]

    #make them strings and trim them up
    @l_2 = wk_line_2.join("\s").rstrip
    @l_3 = wk_line_3.join("\s").rstrip
    @l_4 = wk_line_4.join("\s").rstrip
    @l_5 = wk_line_5.join("\s").rstrip
    @l_6 = wk_line_6.join("\s").rstrip
    @l_7 = wk_line_7.join("\s").rstrip

  end

  def render
    return "#{m_y}\n#{l_1}\n#{l_2}\n#{l_3}\n#{l_4}\n#{l_5}\n#{l_6}\n#{l_7}\n"
  end

end
