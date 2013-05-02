require 'test/unit'
require 'rcal.rb'

class CalUnitTest < Test::Unit::TestCase

  def test_1_require_arguments
    assert_raise ArgumentError do
      RubyCal.new
    end
  end

  def test_1a_take_arguments
    cal = RubyCal.new(1, 2010)
    assert_equal(1, cal.month)
    assert_equal(2010, cal.year)
  end

  def test_1b_take_string_arguments
    cal = RubyCal.new("1", "2010")
    assert_equal(1, cal.month)
    assert_equal(2010, cal.year)
  end

  def test_1c_take_word_arguments
    cal = RubyCal.new("January", "2010")
    assert_equal(1, cal.month)
    assert_equal(2010, cal.year)
  end

  def test_1d_take_shorthand_arguments
    cal = RubyCal.new("Jan", "10")
    assert_equal(1, cal.month)
    assert_equal(2010, cal.year)
  end

  def test_2_long_months
    cal = RubyCal.new(1, 2010)
    assert_equal("January", cal.long_month_name)
  end

  def test_3a_year_types
    cal = RubyCal.new(1, 1900)
    assert_equal(false, cal.is_leap_year?)
  end

  def test_3b_year_types
    cal = RubyCal.new(1, 2000)
    assert_equal(true, cal.is_leap_year?)
  end

  def test_3c_year_types
    cal = RubyCal.new(1, 2004)
    assert_equal(true, cal.is_leap_year?)
  end

  def test_3d_year_types
    cal = RubyCal.new(1, 2100)
    assert_equal(false, cal.is_leap_year?)
  end

  def test_5a_month_year_banner
    cal = RubyCal.new(1, 2000)
    assert_equal("    January 2000", cal.month_year)
  end

  def test_5b_month_banner
    cal = RubyCal.new(1, 2000)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.week_days)
  end

  def test_6a_number_of_days_in_month
    cal = RubyCal.new(1, 2013)
    assert_equal(31, cal.days_in_month)
  end

  def test_6b_number_of_days_in_non_leap_month
    cal = RubyCal.new(2, 2013)
    assert_equal(28, cal.days_in_month)
  end

  def test_6c_number_of_days_in_leap_month
    cal = RubyCal.new(2, 2004)
    assert_equal(29, cal.days_in_month)
  end

  def test_7a_check_month_that_starts_on_Sunday
    cal = RubyCal.new(9, 2013)
    assert_equal(0, cal.starting_day)
  end

  def test_7b_check_month_that_starts_on_monday
    cal = RubyCal.new(4, 2013)
    assert_equal(1, cal.starting_day)
  end

  def test_7c_check_month_that_starts_on_Tuesday
    cal = RubyCal.new(10, 2013)
    assert_equal(2, cal.starting_day)
  end

  def test_7d_check_month_that_starts_on_Wednesday
    cal = RubyCal.new(5, 2013)
    assert_equal(3, cal.starting_day)
  end

  def test_7e_check_month_that_starts_on_Thursday
    cal = RubyCal.new(8, 2013)
    assert_equal(4, cal.starting_day)
  end

  def test_7f_check_month_that_starts_on_Friday
    cal = RubyCal.new(11, 2013)
    assert_equal(5, cal.starting_day)
  end

  def test_7g_check_month_that_starts_on_Saturday
    cal = RubyCal.new(6, 2013)
    assert_equal(6, cal.starting_day)
  end

  def test_8_format_first_week_of_month
    cal = RubyCal.new(5, 2013)
    assert_equal("          1  2  3  4", cal.week_numbers[0])
  end

  def test_9_assemble_month_calendar
    cal = RubyCal.new(5, 2013)
    assert_equal("      May 2013\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n", cal.render)
  end

  def test_9a_assemble_year_calendar
    cal = RubyCal.new(5, 2013)
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


end