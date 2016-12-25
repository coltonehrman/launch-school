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

def reduce(arr, acc = nil)
  start = acc.nil? ? 1 : 0
  acc ||= arr.first
  each(arr[start..-1]) do |el|
    acc = yield(acc, el) if block_given?
  end
  acc
end

p reduce([1,2,3]) { |sum, n| sum + n }
