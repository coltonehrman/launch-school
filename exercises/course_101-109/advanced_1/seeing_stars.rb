def top_point(length, pos)
  pos = pos - 1
  print "#{' ' * pos}*#{' ' * (length / 3 - pos)}*#{' ' * (length / 3 - pos)}*\n"
end

def bottom_point(length, pos)
  pos = pos - 1
  print "#{' ' * (length / 3 - pos)}*#{' ' * pos}*#{' ' * pos}*\n"
end

def star(num)
  (1..(num / 2)).each do |n|
    top_point(num, n)
  end
  puts "#{'*' * num}"
  (1..(num / 2)).each do |n|
    bottom_point(num, n)
  end
end

star(9)
