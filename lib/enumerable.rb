require "pry-byebug"

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

  # def my_map
  #   return to_enum(:my_map) unless block_given?

  #   ret = []
  #   my_each { |item| ret << yield(item) }
  #   ret
  # end

  #proc only version
  def my_map(my_proc)
    if my_proc.is_a?(Proc)
      ret = []
      my_each { |item| ret << my_proc.call(item) }
      ret
    else
      raise TypeError.new("#{my_proc} is not a Proc")
    end
  end

  def my_reduce(*args)
    case args.length
    when 0
      raise LocalJumpError.new("no block given") unless block_given?

      acc = self.first
      the_rest = self.to_a.last(self.length - 1)
      the_rest.my_each { |item| acc = yield(acc, item) }
      acc
    when 1
      if args[0].is_a?(Symbol)
        puts "warning: given block not used" if block_given?

        acc = self.first
        the_rest = self.to_a.last(self.length - 1)
        the_rest.my_each { |item| acc = acc.send(args[0], item) }
      else
        raise LocalJumpError.new("no block given") unless block_given?

        acc = args[0]
        self.my_each { |item| acc = yield(acc, item) }
      end
    when 2
      if !args[0].is_a?(Symbol) && args[1].is_a?(Symbol)
        puts "warning: given block not used" if block_given?

        acc = args[0]
        the_rest = self.to_a
        the_rest.my_each { |item| acc = acc.send(args[1], item) }
      else
        raise TypeError
      end
    else
      raise ArgumentError.new ("wrong number of arguments (given #{args.length}, expected 0..2)")
    end
    acc
  end
end
