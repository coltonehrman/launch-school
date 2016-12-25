def permutations(arr)
  return [arr] if arr.size == 1
  result = []
  arr.each_with_index do |el, i|
    sub_arr = arr[0...i] + arr[(i + 1)..-1]
    sub_permutations = permutations(sub_arr)
    sub_permutations.each do |permutation|
      result << [el] + permutation
    end
  end
  result
end

p permutations([2]) == [[2]]

p permutations([1, 2]) == [[1, 2], [2, 1]]

p permutations([1, 2, 3]) == [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
