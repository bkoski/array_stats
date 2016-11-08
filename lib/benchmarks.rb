require 'benchmark'
require_relative 'array_stats'

n = 100
Benchmark.bm(n) do |x|
  x.report("Ruby: ") do
    n.times do
      [12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48].percentile(65)
    end
  end

  x.report("Golang: ") do
    n.times do
      [12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48].percentile_go(65)
    end
  end
end
