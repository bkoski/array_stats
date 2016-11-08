require File.dirname(__FILE__) + '/test_helper.rb'

class TestArrayStats < Test::Unit::TestCase

  context "median" do
    should "return the middle of the set if array length is odd" do
      assert_equal 15, [1,2,15,22,38].median
      assert_equal 15, [1,2,15,22,38].median_go
    end

    should "return the average of the middle of the set if array length is even" do
      assert_equal 10, [1,6,14,22].median
      assert_equal 10, [1,6,14,22].median_go
    end

    should "return nil if the array is empty" do
      assert_nil [].median
      assert_equal 0, [].median_go
    end

    should "sort an array before deriving the median" do
      assert_equal 20, [1,20,50,60,10].median
      assert_equal 20, [1,20,50,60,10].median_go
    end
  end

  context "percentile" do
    should "choose the number at a particular rank if array divides cleanly" do
      assert_equal 36, [12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48].percentile(65)
      assert_equal 36, [12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48].percentile_go(65)
    end

    should "interpolate according to algorithm if array does not divide cleanly" do
      assert_equal 5.5, [3,5,7,8,9,11,13,15].percentile(25)
      assert_equal 5.5, [3,5,7,8,9,11,13,15].percentile_go(25)
      assert_equal 95.1981, [95.1772,95.1567,95.1937,95.1959,95.1442,95.0610,95.1591,95.1195,95.1065,95.0925,95.1990,95.1682].percentile(90).round_to(0.0001)
      assert_equal 95.1981, [95.1772,95.1567,95.1937,95.1959,95.1442,95.0610,95.1591,95.1195,95.1065,95.0925,95.1990,95.1682].percentile_go(90).round_to(0.0001)
    end

    should "return nil if the array is empty" do
      assert_nil [].percentile(30)
      assert_equal 0, [].percentile_go(30)
    end
  end

  context "total_sum" do
    should "return the sum of all elements in the array" do
      assert_equal 12, [2,4,6].total_sum
    end

    should "return an integer if all elements are ints" do
      assert_kind_of Integer, [2,4,6].total_sum
    end

    should "return a float if at least some of the elements are floats" do
      assert_kind_of Float, [2.5,3.5,6].total_sum
    end

    should "return 0 if the array is empty" do
      assert_equal 0, [].total_sum
    end
  end

  context "mean" do
    should "return the mean for the array " do
      assert_equal 7, [2,4,6,8,10,12].mean
      assert_equal 25, [48,29,26,19,3].mean
    end

    should "return nil if the array is empty" do
      assert_nil [].mean
    end
  end
end


