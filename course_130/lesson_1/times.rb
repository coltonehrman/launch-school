def times(num)
  counter = 0
  while counter < num
    yield(counter) if block_given?
    counter += 1
  end
  num
end

return_value = times(5) do |n|
  puts n
end

puts "=> #{return_value}"
