module ArrayStats
  def median
    sorted_array = self.sort
    length = self.length    
    
    if length == 0
      return nil
    elsif length % 2 == 0
      return (sorted_array[length / 2] + sorted_array[length / 2 - 1]) / 2.0
    else
      return sorted_array[length / 2]
    end
  end
end