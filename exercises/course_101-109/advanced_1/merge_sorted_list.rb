def find_spot_to_insert(to_insert, arr)
  arr.each_with_index do |el, i|
    return i if el > to_insert
  end
  arr.count
end

def merge(arr1, arr2)
  return arr1 + arr2 if arr1.empty? || arr2.empty?
  result = arr1.clone
  arr2.each do |el|
    result.insert(find_spot_to_insert(el, result), el)
  end
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
