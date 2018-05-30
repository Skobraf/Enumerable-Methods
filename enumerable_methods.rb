module Enumerable
  def my_each
    for i in 0...self.length do
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end
  end

  def my_select
    new_arr = []
    self.my_each do |value|
      if(yield)
        new_arr << value
      end
    end
  end

  def my_all?
    self.my_each do |value|
      if !yield(value)
        return false
      end
    end
    return true
  end

end

[1,2,3].my_each do |x|
  puts x
end

[1,2,3].my_each_with_index do |value,index|
  puts "the value is: #{value} with the index of : #{index}"
end

evenNumbers = [1,2,3,5,6,7,8].my_select do |value|
  value % 2 == 0
end

puts "Testing my_all?"
result = [1,1,1,1].my_all? do |value|
  value == 1
end
