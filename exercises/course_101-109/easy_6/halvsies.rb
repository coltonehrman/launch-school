def halvsies(arr)
  middle = arr.delete_at(arr.size / 2) if arr.size.odd?
  first = arr[0...arr.size / 2] + [middle]
  second = arr[(arr.size / 2)..-1]
  [first.compact, second.compact]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
