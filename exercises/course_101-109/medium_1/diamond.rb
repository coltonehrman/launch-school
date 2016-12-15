def diamond(size)
  middle = size / 2 + 1
  stars = 1
  times = 0
  loop do
    times += 1
    puts ('*' * stars).center(size)
    stars += 2 if times < middle
    stars -= 2 if times >= middle
    break if times == size
  end
end

diamond(7)
