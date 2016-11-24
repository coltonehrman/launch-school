# Below we have given you an array and a number.
# Write a program that checks to see if the number appears in the array.

def easy_appears_in(num, arr) arr.include?(num) end

def appears_in(num, arr)
  length = arr.select { |item| item == num }.length
  return ( length > 0 ) ? true : false
end

arr = [1, 3, 5, 7, 9, 11]
number = 3

puts easy_appears_in(number, arr), appears_in(number, arr)
