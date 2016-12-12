def triangle(num)
  (num + 1).times { |n| puts "#{'*' * n}".rjust(num) }
end

triangle(9)
