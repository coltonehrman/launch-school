def fibonacci(times)
  fib = [1, 1]
  count = fib.count
  loop do
    count += 1
    fib = [fib.last % 10, (fib.first + fib.last) % 10 ]
    return fib.last if count == times
  end
end

def fibonacci_last(times)
  last = fibonacci(times)
  last.to_s.split('').last.to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
