class Float
  
  def fractional_part?
    fractional_part != 0.0
  end
  
  def fractional_part
    (self - self.truncate).abs
  end
  
  def integer_part
    self.truncate
  end
  
end