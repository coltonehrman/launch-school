# Write a program that iterates over an array and builds a new array that is the
# result of incrementing each value in the original array by a value of 2.
# You should have two arrays at the end of this program, The original array and the
# new array you've created. Print both arrays to the screen using the p method instead of puts.

def easy_add_two(arr)
  return arr.map { |item| item + 2 }
end

def add_two(arr)
  new_arr = []
  for item in arr do
    new_arr << item + 2
  end
  return new_arr
end

arr = [1, 2, 3, 4, 5]

puts easy_add_two(arr).to_s
puts add_two(arr).to_s
