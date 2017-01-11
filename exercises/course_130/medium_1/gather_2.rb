items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*vegs, wheat|
  puts vegs.join(', ')
  puts wheat
end

puts ""

gather(items) do |apple, *c_produce, wheat|
  puts apple
  puts c_produce.join(', ')
  puts wheat
end

puts ""

gather(items) do |first, *other|
  puts first
  puts other.join(', ')
end

puts ""

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, #{wheat}"
end
