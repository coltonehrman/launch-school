def valid_triangle?(a, b, c)
  sorted = [a, b, c].sort
  !(sorted.first.zero? || sorted.take(2).reduce(&:+) <= sorted.last)
end

def triangle(a, b, c)
  return :invalid unless valid_triangle?(a, b, c)
  if a == b && b == c
    :equilateral
  elsif a != b && b != c && c != a
    :scalene
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
