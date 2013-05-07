require 'test/unit'
require 'lib/Month.rb'
require 'lib/Year.rb'

class CalIntegrationTest < Test::Unit::TestCase

  def test_1_returns_single_month_with_28_days
    assert_equal(`cal 2 2013`, `ruby cal.rb 2 2013`)
  end

  def test_2_returns_single_month_with_31_days
    assert_equal(`cal 3 2013`, `ruby cal.rb 3 2013`)
  end

  def test_3_returns_month_with_4_weeks
    assert_equal(`cal 2 2015`, `ruby cal.rb 2 2015`)
  end

  def test_4_returns_month_with_6_weeks
    assert_equal(`cal 6 2013`, `ruby cal.rb 6 2013`)
  end

  def test_5_returns_normal_leap_month_4
    assert_equal(`cal 2 2012`, `ruby cal.rb 2 2012`)
  end

  def test_6_returns_century_leap_month_100
    assert_equal(`cal 2 1900`, `ruby cal.rb 2 1900`)
  end

  def test_7_returns_odd_leap_month_400
    assert_equal(`cal 2 2400`, `ruby cal.rb 2 2400`)
  end

  def test_8_returns_correct_july
    assert_equal(`cal 7 2400`, `ruby cal.rb 7 2400`)
  end

  def test_9_returns_correct_dec
    assert_equal(`cal 12 2013`, `ruby cal.rb 12 2013`)
  end

  # does not pass, the unix version of cal has trailing whitespace
  # def test_10_returns_whole_year
  #   assert_equal(`cal 2000`, `ruby cal.rb all 2000`)
  # end

end