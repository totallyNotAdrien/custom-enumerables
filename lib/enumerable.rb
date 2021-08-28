module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for i in 0...self.length
      if is_a?(Hash)
        yield([keys[i], values[i]])
      else
        yield(self[i])
      end
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    for i in 0...self.length
      if is_a?(Hash)
        yield([keys[i], values[i]], i)
      else
        yield(self[i], i)
      end
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    ret = []
    my_each { |item| ret << item if yield(item) }
    if is_a?(Hash)
      new_ret = Hash.new(0)
      ret.my_each { |pair| new_ret[pair[0]] = pair[1] }
      ret = new_ret
    end
    ret
  end

  def my_all?
    if block_given?
      my_each do |item|
        return false unless yield(item)
      end
      true
    else
      my_all? { |item| item }
    end
  end

  def my_any?
    if block_given?
      my_each do |item|
        return true if yield(item)
      end
      false
    else
      my_any? { |item| item }
    end
  end

  def my_none?
    if block_given?
      my_each do |item|
        return false if yield(item)
      end
      true
    else
      my_none? { |item| item }
    end
  end

  def my_count(*args)
    caller_info = caller.first.split(":")
    caller_info = caller_info.first(2).join(":")
    num = 0
    if args.length == 0
      if block_given?
        my_each { |item| num += 1 if yield(item) }
      else
        num = self.length
      end
    else
      puts "#{caller_info}: warning: given block not used" if block_given?
      my_each { |item| num += 1 if item == args[0] }
    end
    num
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    ret = []
    my_each {|item| ret << yield(item)}
    ret
  end

  #only accept start value and/or block
  def my_reduce(*args)
    if block_given?
      if args.length == 0
        acc = self.first
      else
        acc = args[0]
      end
    else
    end
  end
end
