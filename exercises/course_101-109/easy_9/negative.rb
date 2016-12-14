def negative(num)
  num.zero? ? 0 : -num.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
