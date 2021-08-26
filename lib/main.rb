require_relative "enumerable.rb"

def numbers 
  (1..6).to_a
end
def hashy
  { milk: 32, "taco" => "chocolate", baby: "42" }
end

puts "my_each vs each: array"
ret = numbers.my_each { |item| puts "#{item} UwU" }
puts "returns: #{ret}"
puts

ret = numbers.each { |item| puts "#{item} OwO" }
puts "returns: #{ret}"
puts

puts "my_each vs each: hash"
ret = hashy.my_each { |item| puts "#{item} UwU" }
puts "returns: #{ret}"
puts

ret = hashy.each { |item| puts "#{item} OwO" }
puts "returns: #{ret}"
puts

puts "my_each_with_index vs each_with_index: array"
ret = numbers.my_each_with_index do |item, index|
  puts "Number at index #{index} is #{item}"
end
puts "returns: #{ret}"
puts

ret = numbers.each_with_index do |item, index|
  puts "Number at index #{index} is #{item}"
end
puts "returns: #{ret}"
puts

puts "my_each_with_index vs each_with_index: hash"
ret = hashy.my_each_with_index do |item, index|
  puts "Item at index #{index} is #{item}"
end
puts "returns: #{ret}"
puts

ret = hashy.each_with_index do |item, index|
  puts "Item at index #{index} is #{item}"
end
puts "returns: #{ret}"
puts

puts "my_select vs select: array"
puts "Greater than 3"
ret = numbers.my_select { |num| num > 3 }
puts "returns: #{ret}"
puts

ret = numbers.select { |num| num > 3 }
puts "returns: #{ret}"
puts

puts "my_select vs select: hash"
puts "val is a String"
ret = hashy.my_select do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
puts

ret = hashy.select do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
