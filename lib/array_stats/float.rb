class Float
  
  # Returns true if a float has a fractional part; i.e. <tt>f == f.to_i</tt>
  def fractional_part?
    fractional_part != 0.0
  end
  
  # Returns the fractional part of a float. For example, <tt>(6.67).fractional_part == 0.67</tt>
  def fractional_part
    (self - self.truncate).abs
  end
  
end