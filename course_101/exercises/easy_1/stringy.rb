def stringy(num)
  output = ''
  num.times { |i| output += i.even? ? '1' : '0' }
  output
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
