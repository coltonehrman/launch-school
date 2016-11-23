# Exercise 1:
# Add two strings together that, when concatenated, return your first and last name as your full name in one string.
first_name = "Colton"
last_name = "Ehrman"
full_name = first_name + " " + last_name

puts full_name
puts "\n"

# Exercise 2:
# Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the:
# 1) thousands place
# 2) hundreds place
# 3) tens place
# 4) ones place

num = 4058
thousands_place = num / 1000 % 10
hundreds_place  = num / 100 % 10
tens_place      = num / 10 % 10
ones_place      = num / 1 % 10

puts "num = #{num}"
puts "#{thousands_place}#{hundreds_place}#{tens_place}#{ones_place}"
puts "\n"

# Exercise 3:
# Write a program that uses a hash to store a list of movie titles with the year they came out.
# Then use the puts command to make your program print out the year of each movie to the screen.
# The output for your program should look something like this

movies_hash = {
  step_brothers: 2008,
  the_other_guys: 2010,
  gladiator: 2000,
  forrest_gump: 1994
}

puts movies_hash[:step_brothers]
puts movies_hash[:the_other_guys]
puts movies_hash[:gladiator]
puts movies_hash[:forrest_gump]
puts "\n"

# Exercise 4:
# Use the dates from the previous example and store them in an array.
# Then make your program output the same thing as exercise 3.

movie_years_array = [
  movies_hash[:step_brothers],
  movies_hash[:the_other_guys],
  movies_hash[:gladiator],
  movies_hash[:forrest_gump]
]

puts movie_years_array[0]
puts movie_years_array[1]
puts movie_years_array[2]
puts movie_years_array[3]
puts "\n"

# Exercise 5:
# Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

puts "Factorial of 5: #{1 * 2 * 3 * 4 * 5}"
puts "Factorial of 6: #{1 * 2 * 3 * 4 * 5 * 6}"
puts "Factorial of 7: #{1 * 2 * 3 * 4 * 5 * 6 * 7}"
puts "Factorial of 8: #{1 * 2 * 3 * 4 * 5 * 6 * 7 * 8}"
puts "\n"

# Exercise 6:
# Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.

puts "Square of 12.44: #{12.44**2}"
puts "Square of 36.77: #{36.77**2}"
puts "Square of 42.49: #{36.49**2}"

# Exercise 7:
# What does the following error message tell you?
#
# SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
#   from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
#
# Answer:
# Put a paranthesis ")" instead of a "}"
