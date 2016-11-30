# Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the:
# 1) thousands place
# 2) hundreds place
# 3) tens place
# 4) ones place

num = 4058
thousands_place = num / 1000 % 10
hundreds_place  = num / 100 % 10
tens_place      = num / 10 % 10
ones_place      = num / 1 % 10

puts "num = #{num}"
puts "#{thousands_place}#{hundreds_place}#{tens_place}#{ones_place}"
