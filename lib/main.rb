require_relative "enumerable.rb"

puts "my_each vs each"
numbers = (1..9).to_a
ret1 = numbers.my_each {|item| puts "#{item} UwU"}
puts "returns: #{ret1}"
puts

ret2 = numbers.each {|item| puts "#{item} OwO"}
puts "returns: #{ret2}"
