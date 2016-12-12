def multiply_list(list1, list2)
  list1.zip(list2).reduce([]) { |arr, n| arr << (n[0] * n[1]) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
