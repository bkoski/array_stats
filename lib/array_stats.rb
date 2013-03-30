$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ArrayStats
  VERSION = '0.6.0'
end

require "#{File.dirname(__FILE__)}/array_stats/float"
require "#{File.dirname(__FILE__)}/array_stats/array_stats"
require "#{File.dirname(__FILE__)}/array_stats/array"

