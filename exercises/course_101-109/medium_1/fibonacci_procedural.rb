def fibonacci(times)
  fib = [1, 1]
  count = fib.count
  loop do
    count += 1
    fib = [fib[-1], fib[-1] + fib[-2]]
    return fib.last if count == times
  end
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
