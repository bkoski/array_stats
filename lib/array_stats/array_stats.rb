module ArrayStats
  
  def sum
    self.inject(0) {|sum, sample| sum += sample}
  end
  
  def mean
    if self.length == 0
      nil
    else
      self.sum / self.length
    end
  end

  def median
    percentile(50)
  end
  
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