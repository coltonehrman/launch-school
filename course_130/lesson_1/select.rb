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

def select(arr)
  new_arr = []
  each(arr) do |el|
    next unless yield(el)
    new_arr << el
  end
  new_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
