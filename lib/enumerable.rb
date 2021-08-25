module Enumerable
  def my_each
    if block_given?
      for i in 0...self.length
        if is_a?(Hash)
          yield([keys[i], values[i]])
        else
          yield(self[i])
        end
      end
      self
    else
      to_enum
    end
  end

  def my_each_with_index
    if block_given?
      for i in 0...self.length
        if is_a?(Hash)
          yield([keys[i], values[i]], i)
        else
          yield(self[i], i)
        end
      end
      self
    else
      to_enum
    end
  end
end
