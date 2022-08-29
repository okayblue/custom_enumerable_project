module Enumerable
  # Your code goes here
  def my_all?
    # for el in self
    #   return false if (yield el) == false
    # end
    my_each {|elem| return false if !yield elem}
    true
  end

  def my_any
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


# array = [1, 2, 3, 9]

# array.my_each do |element|
#   puts element
# end

# array.my_all? { |value| value < 5 }