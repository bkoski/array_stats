require File.dirname(__FILE__) + '/test_helper.rb'

class TestFloatExtensions < Test::Unit::TestCase

  context "fractional_part?" do
    should "return true for a number with a fractional part" do
      n = 1.249
      assert n.fractional_part?
    end

    should "return true for a number without a fractional part" do
       n = 1.0
       assert !n.fractional_part?
     end
  end

  context "fractional_part" do
    should "return the decimal parts for a number" do
      n = 12.2456
      assert_in_delta 0.2456, n.fractional_part, 0.00000001
    end

    should "retrun the decimal parts, even if they are 0" do
      n = 12.0
      assert_equal 0.0, n.fractional_part
    end

    should "retrun the decimal as a positive number, even if the original float is negative" do
      n = -12.2399
      assert_in_delta 0.2399, n.fractional_part, 0.00000001
    end
  end
end
