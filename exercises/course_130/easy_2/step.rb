def step(start, last, iteration)
  curr = 1
  until curr > last
    yield(curr)
    curr += iteration
  end
  start
end

step(1, 10, 3) { |value| puts "value = #{value}" }
