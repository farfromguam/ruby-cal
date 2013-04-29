require 'test/unit'
require 'cal.rb'

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

  def test_2_long_months
    cal = RubyCal.new(1, 2010)
    assert_equal("January", cal.lo_month)
  end

  def test_3a_year_types
    cal = RubyCal.new(1, 1900)
    assert_equal("Normal", cal.year_type)
  end

  def test_3b_year_types
    cal = RubyCal.new(1, 2000)
    assert_equal("Leap", cal.year_type)
  end

  def test_3c_year_types
    cal = RubyCal.new(1, 2004)
    assert_equal("Leap", cal.year_type)
  end

  def test_3d_year_types
    cal = RubyCal.new(1, 2100)
    assert_equal("Normal", cal.year_type)
  end

  def test_4_month_year
    cal = RubyCal.new(1, 2000)
    assert_equal("    January 2000", cal.month_year)
  end

  def test_5_days
    cal = RubyCal.new(1, 2000)
    assert_equal("Su Mo Tu We Th Fr Sa", cal.day_names)
  end

  def test_6a_number_of_days_in_month
    cal = RubyCal.new(1, 2013)
    assert_equal(31, cal.days)
  end

  def test_6b_number_of_days_in_non_leap_month
    cal = RubyCal.new(2, 2013)
    assert_equal(28, cal.days)
  end

  def test_6c_number_of_days_in_leap_month
    cal = RubyCal.new(2, 2004)
    assert_equal(29, cal.days)
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

  def test_5_format_days_of_month

  end

  def test_6_assemble_month_calendar

  end

end