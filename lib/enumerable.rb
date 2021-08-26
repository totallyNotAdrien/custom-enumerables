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
end
