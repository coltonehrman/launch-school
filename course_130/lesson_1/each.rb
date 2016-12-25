def times(num)
  counter = 0
  while counter < num
    yield(counter) if block_given?
    counter += 1
  end
  num
end

def each(arr)
  times(arr.count) do |i|
    yield(arr[i]) if block_given?
  end
  arr
end

return_value = each([1,2,3]) do |el|
  puts el
end

puts "=> #{return_value}"
