require 'test/unit'
require 'lib/Month.rb'
require 'lib/Year.rb'

class CalUnitTest < Test::Unit::TestCase

  def test_1_require_arguments
    assert_raise ArgumentError do
      Month.new
    end
  end

  def test_1a_take_arguments
    cal = Month.new(1, 2010)
    assert_equal(1, cal.month)
    assert_equal(2010, cal.year)
  end

  # def test_1c_take_word_arguments
  #   cal = Month.new("January", "2010")
  #   assert_equal(1, cal.month)
  #   assert_equal(2010, cal.year)
  # end

  # def test_1d_take_shorthand_arguments
  #   cal = Month.new("Jan", "10")
  #   assert_equal(1, cal.month)
  #   assert_equal(2010, cal.year)
  # end

  def test_2_long_months
    cal = Month.new(1, 2010)
    assert_equal("January", cal.long_month_name)
  end

  def test_3a_year_type_normal
    cal = Month.new(1, 1900)
    assert_equal(false, cal.is_leap_year?)
  end

  def test_3b_year_type_leap
    cal = Month.new(1, 2000)
    assert_equal(true, cal.is_leap_year?)
  end

  def test_3c_year_type_leap
    cal = Month.new(1, 2004)
    assert_equal(true, cal.is_leap_year?)
  end

  def test_3d_year_type_normal
    cal = Month.new(1, 2100)
    assert_equal(false, cal.is_leap_year?)
  end

  def test_4a_month_year_banner
    cal = Month.new(1, 2000)
    assert_equal("    January 2000", cal.month_year)
  end

  def test_4b_month_banner
    cal = Month.new(1, 2000)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.week_days)
  end

  def test_5a_number_of_days_in_month
    cal = Month.new(1, 2013)
    assert_equal(31, cal.days_in_month)
  end

  def test_5b_number_of_days_in_non_leap_month
    cal = Month.new(2, 2013)
    assert_equal(28, cal.days_in_month)
  end

  def test_5c_number_of_days_in_leap_month
    cal = Month.new(2, 2004)
    assert_equal(29, cal.days_in_month)
  end

  def test_6a_check_month_that_starts_on_Sunday
    cal = Month.new(9, 2013)
    assert_equal(0, cal.starting_day)
  end

  def test_6b_check_month_that_starts_on_monday
    cal = Month.new(4, 2013)
    assert_equal(1, cal.starting_day)
  end

  def test_6c_check_month_that_starts_on_Tuesday
    cal = Month.new(10, 2013)
    assert_equal(2, cal.starting_day)
  end

  def test_6d_check_month_that_starts_on_Wednesday
    cal = Month.new(5, 2013)
    assert_equal(3, cal.starting_day)
  end

  def test_6e_check_month_that_starts_on_Thursday
    cal = Month.new(8, 2013)
    assert_equal(4, cal.starting_day)
  end

  def test_6f_check_month_that_starts_on_Friday
    cal = Month.new(11, 2013)
    assert_equal(5, cal.starting_day)
  end

  def test_6g_check_month_that_starts_on_Saturday
    cal = Month.new(6, 2013)
    assert_equal(6, cal.starting_day)
  end

  def test_7_format_first_week_of_month
    cal = Month.new(5, 2013)
    assert_equal("          1  2  3  4", cal.week_numbers[0])
  end

  def test_8a_assemble_month_calendar
    cal = Month.new(5, 2013)
    expected = %Q{      May 2013
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

}
    assert_equal(expected, cal.return_month)

  end

  def test_9_assemble_year_array
    cal = Month.new(5, 2013)
    assert_equal(
     ["        May         ",
      "Su Mo Tu We Th Fr Sa",
      "          1  2  3  4",
      " 5  6  7  8  9 10 11",
      "12 13 14 15 16 17 18",
      "19 20 21 22 23 24 25",
      "26 27 28 29 30 31   ",
      "                    "], cal.year_view_array)
  end

  def test_10_year_banner
    cal = Year.new(2000)
    assert_equal("                             2000", cal.banner)
  end

  def test_11_assemble_first_3_months
    year = Year.new(2000)
    expected = %Q{      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1         1  2  3  4  5            1  2  3  4
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18
16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25
23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31
30 31}
    assert_equal(expected, year.assemble(1,2,3))
  end

  def test_12_assemble_year
    year = Year.new(2000)
    expected = %Q{                             2000

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1         1  2  3  4  5            1  2  3  4
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18
16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25
23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31
30 31
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1      1  2  3  4  5  6               1  2  3
 2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
 9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
30
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1         1  2  3  4  5                  1  2
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
30 31
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4                  1  2
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
                                            31}

    assert_equal(expected, year.return_year)
  end

end