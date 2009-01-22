module ArrayStats
  
  # Returns the sum of all elements in the array; 0 if array is empty
  def sum
    self.inject(0) {|sum, sample| sum += sample}
  end
  
  # Returns the mean of all elements in array; nil if array is empty
  def mean
    if self.length == 0
      nil
    else
      self.sum / self.length
    end
  end

  # Returns the median for the array; nil if array is empty
  def median
    percentile(50)
  end
  
  # Returns the percentile value for percentile _p_; nil if array is empty.
  #
  # _p_ should be expressed as an integer; <tt>percentile(90)</tt> returns the 90th percentile of the array.
  #
  # Algorithm from NIST[http://www.itl.nist.gov/div898/handbook/prc/section2/prc252.htm]
  def percentile p
    sorted_array = self.sort
    rank = (p.to_f / 100) * (self.length + 1)
    
    if self.length == 0
      return nil
    elsif rank.fractional_part?
      sample_0 = sorted_array[rank.truncate - 1]
      sample_1 = sorted_array[rank.truncate]

      return (rank.fractional_part * (sample_1 - sample_0)) + sample_0
    else
      return sorted_array[rank - 1]
    end    
  end
  
end