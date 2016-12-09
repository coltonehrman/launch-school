SQ_FEET_PER_SQ_METER = 10.7639

puts "Enter the length of the room in meters:"
len = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_in_meters = len * width
area_in_feet = area_in_meters * SQ_FEET_PER_SQ_METER

puts "The area of the room is #{area_in_meters} square meters (#{area_in_feet} square feet)."
