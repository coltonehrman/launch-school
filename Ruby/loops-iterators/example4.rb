# Write a method that counts down to zero using recursion.

def count_down(num)
  puts "#{num}"
  return count_down(num - 1) if num != 0
end

count_down(5)
