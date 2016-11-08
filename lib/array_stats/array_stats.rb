require 'ffi'
require 'pry'

module ArrayStats
  extend FFI::Library
  ffi_lib '../ext/array_stats/libgostats.so'
  attach_function :percentile_func, [:pointer, :int, :double], :double

  # Returns the sum of all elements in the array; 0 if array is empty
  def total_sum
    self.inject(0) {|sum, sample| sum += sample}
  end

  # Returns the mean of all elements in array; nil if array is empty
  def mean
    if self.length == 0
      nil
    else
      self.total_sum / self.length
    end
  end

  # Returns the median for the array; nil if array is empty
  def median
    percentile(50)
  end

  def median_go
    percentile_go(50)
  end

  # Returns the percentile value for percentile _p_; nil if array is empty.
  #
  # _p_ should be expressed as an integer; <tt>percentile(90)</tt> returns the 90th percentile of the array.
  #
  # Algorithm from NIST[http://www.itl.nist.gov/div898/handbook/prc/section2/prc252.htm]
  def percentile p
    sorted_array = self.sort
    rank = (p.to_f / 100) * (self.length + 1)

    return nil if self.length == 0

    if rank.truncate > 0 && rank.truncate < self.length
      sample_0 = sorted_array[rank.truncate - 1]
      sample_1 = sorted_array[rank.truncate]

      (rank.fractional_part * (sample_1 - sample_0)) + sample_0
    elsif rank.truncate == 0
      sorted_array.first.to_f
    elsif rank.truncate == self.length
      sorted_array.last.to_f
    end
  end

  def percentile_go(percent)
    pointer = FFI::MemoryPointer.new(:double, self.size)
    pointer.put_array_of_float64(0, self)

    percentile_func(pointer, self.size, percent)
  end
end
