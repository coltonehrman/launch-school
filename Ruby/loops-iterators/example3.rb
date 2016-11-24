# Use the each_with_index method to iterate through an array
# of your creation that prints each index and value of the array.

arr = [1, 2, 3, 4, 5]

arr.each_with_index do |value, index|
  puts "arr[#{index}] == #{value}"
end
