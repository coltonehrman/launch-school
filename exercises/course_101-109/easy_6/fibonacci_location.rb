def find_fibonacci_index_by_length(digits)
  fib = [1, 1]
  times = 2
  loop do
    times += 1
    fib << fib[-1] + fib[-2]
    return times if fib.last.to_s.length == digits
  end
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
