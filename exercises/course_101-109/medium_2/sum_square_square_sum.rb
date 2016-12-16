def sum_squared(num)
  (1..num).reduce(&:+) ** 2
end

def squares_sum(num)
  (1..num).map { |n| n ** 2}.reduce(&:+)
end

def sum_square_difference(num)
  sum_squared(num) - squares_sum(num)
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
