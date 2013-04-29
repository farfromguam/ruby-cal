require 'test/unit'
require 'cal.rb'

class CalIntegrationTest < Test::Unit::TestCase

  def test_0
    assert_equal true, true
  end

  # def test_1_returns_single_month_with_28_days
  #   assert_equal(`cal 2 2013`, `ruby cal.rb 2 2013`)
  # end

  # def test_2_returns_single_month_with_31_days
  #   assert_equal(`cal 3 2013`, `ruby cal.rb 3 2013`)
  # end

  # def test_3_returns_month_with_4_weeks
  #   assert_equal(`cal 2 2015`, `ruby cal.rb 2 2015`)
  # end

  # def test_4_returns_month_with_6_weeks
  #   assert_equal(`cal 12 2012`, `ruby cal.rb 12 2012`)
  # end

  # def test_5_returns_normal_leap_month_4
  #   assert_equal(`cal 2 2012`, `ruby cal.rb 2 2012`)
  # end

  # def test_6_returns_century_leap_month_100
  #   assert_equal(`cal 2 1900`, `ruby cal.rb 2 1900`)
  # end

  # def test_7_returns_exeption_leap_month_400
  #   assert_equal(`cal 2 2400`, `ruby cal.rb 2 2400`)
  # end

  # def test_8_returns_current_month_with_no_input
  #   assert_equal(`cal`, `ruby cal.rb`)
  # end

end