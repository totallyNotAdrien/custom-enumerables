require_relative "enumerable.rb"

def numbers
  (1..6).to_a << 2
end

def hashy
  { milk: 32, "taco" => "chocolate", baby: "42" }
end

#-----------EACH---------------------------------------------
puts "my_each vs each: array"
ret = numbers.my_each { |item| puts "#{item}" }
puts "returns: #{ret}"
puts

ret = numbers.each { |item| puts "#{item}" }
puts "returns: #{ret}"
puts

puts "my_each vs each: hash"
ret = hashy.my_each { |item| puts "#{item}" }
puts "returns: #{ret}"
puts

ret = hashy.each { |item| puts "#{item}" }
puts "returns: #{ret}"
puts

#-----------EACH WITH INDEX---------------------------------------------
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

#----------SELECT----------------------------------------------
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
puts

#-----------ALL?---------------------------------------------
puts "my_all? vs all?: array"
puts "all nums greater than 0"
ret = numbers.my_all? { |num| num > 0 }
puts "returns: #{ret}"
puts

ret = numbers.all? { |num| num > 0 }
puts "returns: #{ret}"
puts

puts "my_all? vs all?: hash"
puts "all vals are strings"
ret = hashy.my_all? do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
puts

ret = hashy.all? do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"

#---------ANY?-----------------------------------------------
puts "my_any? vs any?: array"
puts "any num greater than 4"
ret = numbers.my_any? { |num| num > 4 }
puts "returns: #{ret}"
puts

ret = numbers.any? { |num| num > 4 }
puts "returns: #{ret}"
puts

puts "my_any? vs any?: hash"
puts "any val is a string"
ret = hashy.my_any? do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
puts

ret = hashy.any? do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
puts

#---------NONE?-----------------------------------------------
puts "my_none? vs none?: array"
puts "no num greater than 8"
ret = numbers.my_none? { |num| num > 8 }
puts "returns: #{ret}"
puts

ret = numbers.none? { |num| num > 8 }
puts "returns: #{ret}"
puts

puts "my_none? vs none?: hash"
puts "no val is a string"
ret = hashy.my_none? do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
puts

ret = hashy.none? do |key, val|
  puts "key: #{key}, val: #{val}"
  val.is_a?(String)
end
puts "returns: #{ret}"
puts

#---------COUNT-----------------------------------------------
puts "my_count vs count: array"
puts "my_count:"
puts "count all entries: #{numbers.my_count}"
puts "count 2s: #{numbers.my_count(2)}"
puts "count evens: #{numbers.my_count { |num| num % 2 == 0 }}"
puts
puts "count:"
puts "count all entries: #{numbers.count}"
puts "count 2s: #{numbers.count(2)}"
puts "count evens: #{numbers.count { |num| num % 2 == 0 }}"
puts

puts "my_count vs count: hash"
puts "my_count:"
puts "count all entries: #{hashy.my_count}"
puts "count string keys: #{hashy.my_count { |key, _val| key.is_a?(String) }}"
puts "count string values: #{hashy.my_count { |_key, val| val.is_a?(String) }}"
puts

puts "count:"
puts "count all entries: #{hashy.count}"
puts "count string keys: #{hashy.count { |key, _val| key.is_a?(String) }}"
puts "count string values: #{hashy.count { |_key, val| val.is_a?(String) }}"
puts

#---------MAP-----------------------------------------------
puts "my_map vs map: array"
puts "numbers: #{numbers}"
puts "my_map:"
puts "square everything: #{numbers.my_map { |num| num ** 2 }}"
puts "even or odd: #{numbers.my_map { |num| num % 2 == 0 ? "even" : "odd" }}"
puts "divide by 2.0: #{numbers.my_map { |num| num / 2.0 }}"
puts

puts "map:"
puts "square everything: #{numbers.map { |num| num ** 2 }}"
puts "even or odd: #{numbers.map { |num| num % 2 == 0 ? "even" : "odd" }}"
puts "divide by 2.0: #{numbers.map { |num| num / 2.0 }}"
puts

puts "my_map vs map: hash"
puts "my_map:"
puts "to class of key: #{hashy.my_map { |key, _val| key.class }}"
puts

puts "map:"
puts "to class of key: #{hashy.map { |key, _val| key.class }}"
puts

#---------REDUCE-----------------------------------------------
def multiply_els_my_reduce(arr)
  arr.my_reduce { |sum, num| sum *= num }
end

def multiply_els_reduce(arr)
  arr.reduce { |sum, num| sum *= num }
end

puts "my_reduce vs reduce: array"
puts "my_reduce:"
puts "multiply everything: " +
    "#{numbers.join(" * ")} = #{multiply_els_my_reduce(numbers)}"

puts "add everything: symbol: " +
    "#{numbers.join(" + ")} = #{numbers.my_reduce(:+)}"

puts "add everything: start_val & symbol: " +
    "#{numbers.join(" + ")} = #{numbers.my_reduce(0, :+)}"
puts "add everything: block: " +
    "#{numbers.join(" + ")} = #{numbers.my_reduce { |sum, num| sum + num }}"
puts

puts "reduce:"
puts "multiply everything: " +
       "#{numbers.join(" * ")} = #{multiply_els_reduce(numbers)}"

puts "add everything: symbol: " +
       "#{numbers.join(" + ")} = #{numbers.reduce(:+)}"

puts "add everything: start_val & symbol: " +
       "#{numbers.join(" + ")} = #{numbers.reduce(0, :+)}"
puts "add everything: block: " +
    "#{numbers.join(" + ")} = #{numbers.reduce { |sum, num| sum + num }}"
puts

puts "my_reduce vs reduce: hash"
puts "my_reduce:"
puts "combine everything: #{hashy.my_reduce(:+)}"
puts "combine everything: block: #{hashy.my_reduce { |sum, item| sum + item }}"
puts

puts "reduce:"
puts "combine everything: #{hashy.reduce(:+)}"
puts "combine everything: block: #{hashy.reduce { |sum, item| sum + item }}"
puts

#---------MAP: PROC VERSION-----------------------------------------------
square = proc { |num| num ** 2 }
parity = proc { |num| num % 2 == 0 ? "even" : "odd" }
half = proc { |num| num / 2.0 }
puts "my_map vs map: proc version: array"
puts "numbers: #{numbers}"
puts "my_map:"
puts "square everything: #{numbers.my_map(square)}"
puts "even or odd: #{numbers.my_map(parity)}"
puts "divide by 2.0: #{numbers.my_map(half)}"
puts

puts "map:"
puts "square everything: #{numbers.map { |num| num ** 2 }}"
puts "even or odd: #{numbers.map { |num| num % 2 == 0 ? "even" : "odd" }}"
puts "divide by 2.0: #{numbers.map { |num| num / 2.0 }}"
puts

key_class =  proc { |(key, _val)| key.class }
puts "my_map vs map: proc version: hash"
puts "my_map:"
puts "to class of key: #{hashy.my_map(key_class)}"
puts

puts "map:"
puts "to class of key: #{hashy.map { |(key, _val)| key.class }}"
puts
