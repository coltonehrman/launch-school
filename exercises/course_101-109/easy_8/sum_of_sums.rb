def sum_of_sums(nums)
  nums = nums.inject([[]]) do |arr, n|
    arr << arr[-1] + [n]
  end
  nums.shift
  nums.reduce(0) do |sum, arr|
    sum + arr.reduce(0) { |sum, n| sum + n }
  end
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
