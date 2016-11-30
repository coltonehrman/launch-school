# Using some of Ruby's built-in Hash methods,
# write a program that loops through a hash and prints all of the keys.
# Then write a program that does the same thing except printing the values.
# Finally, write a program that prints both

me = {
  name: "Colton",
  age: 21,
  language: "Ruby",
  girlfriend: "Valerie"
}

me.each_key { |key| puts "I have a #{key}" }
puts "\n"
me.each_value { |value| puts "#{value}" }
puts "\n"
me.each{ |key, value| puts "My #{key} is #{value}" }
