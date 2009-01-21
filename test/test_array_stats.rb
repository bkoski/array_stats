require File.dirname(__FILE__) + '/test_helper.rb'

class TestArrayStats < Test::Unit::TestCase

  context "median" do
    should "return the middle of the set if array length is odd" do
      assert_equal 15, [1,2,15,22,38].median
    end
    
    should "return the average of the middle of the set if array length is even" do
      assert_equal 10, [1,6,14,22].median
    end
    
    should "return nil if the array is empty" do
      assert_nil [].median
    end
    
    should "sort an array before deriving the median" do
      assert_equal 20, [1,20,50,60,10].median
    end
  end
end
