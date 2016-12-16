def valid_triangle?(a, b, c)
  return false if [a, b, c].any? { |angle| angle == 0 }
  return false unless [a, b, c].reduce(&:+) == 180
  true
end

def triangle(a, b, c)
  return :invalid unless valid_triangle?(a, b, c)
  if [a, b, c].count(90) == 1
    :right
  elsif [a, b, c].all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
