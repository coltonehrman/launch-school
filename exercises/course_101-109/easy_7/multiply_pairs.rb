def multiply_all_pairs(list1, list2)
  list1.product(list2).map { |n| n[0] * n[1] }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
