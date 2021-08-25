require_relative "enumerable.rb"

numbers = (1..6).to_a
hashy = {milk: 32, taco:"chocolate", baby: "42"}

puts "my_each vs each: array"
ret1 = numbers.my_each { |item| puts "#{item} UwU" }
puts "returns: #{ret1}"
puts

ret2 = numbers.each { |item| puts "#{item} OwO" }
puts "returns: #{ret2}"
puts

puts "my_each vs each: hash"
ret1 = hashy.my_each { |item| puts "#{item} UwU" }
puts "returns: #{ret1}"
puts

ret2 = hashy.each { |item| puts "#{item} OwO" }
puts "returns: #{ret2}"
puts

puts "my_each_with_index vs each_with_index: array"
ret1 = numbers.my_each_with_index do |item, index|
  puts "Number at index #{index} is #{item}"
end
puts "returns: #{ret1}"
puts

ret2 = numbers.each_with_index do |item, index|
  puts "Number at index #{index} is #{item}"
end
puts "returns: #{ret2}"
puts

puts "my_each_with_index vs each_with_index: hash"
ret1 = hashy.my_each_with_index do |item, index|
  puts "Item at index #{index} is #{item}"
end
puts "returns: #{ret1}"
puts

ret2 = hashy.each_with_index do |item, index|
  puts "Item at index #{index} is #{item}"
end
puts "returns: #{ret2}"
puts
