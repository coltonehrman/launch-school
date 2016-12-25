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

def merge_sort(arr)
  return arr if arr.count == 1
  merge(merge_sort(arr[0...(arr.count / 2)]), merge_sort(arr[(arr.count / 2)..-1]))
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
