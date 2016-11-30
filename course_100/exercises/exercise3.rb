# Now, using the same array from #2,
# use the select method to extract all odd numbers into a new array.

new_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select do |num|
  num.to_i.odd?
end

p new_arr
