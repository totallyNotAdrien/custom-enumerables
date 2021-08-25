module Enumerable
  def my_each
    for i in 0...self.length do
      yield(self[i])
    end
    self
  end
end