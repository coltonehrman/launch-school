POSITIONS = %w(1st 2nd 3rd 4th 5th last)
nums = []

6.times do |i|
  puts "==> Enter the #{POSITIONS[i]} number:"
  nums << gets.chomp.to_i
end

search = nums.pop
appears = nums.include?(search)
puts "The number #{search} appears in #{nums}" if appears
puts "The number #{search} does not appear in #{nums}" unless appears
