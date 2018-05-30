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

  def my_any?
    self.my_each do |value|
      if yield(value)
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |value|
      if yield(value)
        return false
      end
    end
    return true
  end

  def my_count(x = nil)
    #case 3
    count = 0
    if block_given?
      self.my_each do |value|
        if yield(value)
          count += 1
        end
      end
      return count
    end
    #case 1
    return self.length if x.nil?
    #case 2
    if x
      self.my_each do |value|
        if x == value
          count += 1
        end
      end
      return count
    end
  end

end
# Testing below
puts "Testing my_each"
[1,2,3].my_each do |x|
  puts x
end

puts "Testing my_each_with_index"
[1,2,3].my_each_with_index do |value, i|
  puts "#{value} has index: #{i}."
end

puts "Testing my_select"
evenNumbers = [1,2,3,4,5,6,7,8].my_select do |value|
  value % 2 == 0
end
puts evenNumbers

puts "Testing my_all?"
result = [1,1,1,1].my_all? do |value|
  value == 1
end
puts result

puts "Testing my_any?"
result = [2,2,2,2].my_any? do |value|
  value == 1
end
puts result

puts "Testing my_none?"
result = [2,2,1,2].my_none? do |value|
  value == 1
end
puts result

puts "Testing my_count"
puts [1,2,3,2,2,3,3,3].my_count(5)
puts [1,2,3,2,2,3,3,3].my_count {|value| value == 3}
