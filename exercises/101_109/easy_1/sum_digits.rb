def sum(num)
  num.to_s.chars.reduce(0) { |sum, i| sum + i.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
