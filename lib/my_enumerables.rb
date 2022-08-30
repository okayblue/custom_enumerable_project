module Enumerable
  # Your code goes here
  def my_all?
    my_each {|elem| return false if !yield elem}
    true
  end

  def my_each_with_index
    index = 0
    for elem in self do
      yield elem, index
      index+=1
    end
  end

  def my_select
    new = []
    my_each {|elem| new.push elem if yield elem}
    new
  end

  def my_any?
    my_each {|elem| return true if yield elem}
    false
  end

  def my_count
    count = 0
    if block_given?
      my_each {|elem| count += 1 if yield elem} 
    else
      count = self.length
    end
    count
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
  end
end


# tests
array = [1, 2, 3, 9, 33]

# array.my_count { |value| value > 5 }

# array.my_any?(&:negative?)

# array.my_select { |value| value > 10 }

# array.my_each_with_index do |element, index|
#   puts "element: #{element}, index: #{index}"
# end

# array.my_each do |element|
#   puts element
# end

# array.my_all? { |value| value < 5 }