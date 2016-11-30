# Question 1
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back
# in the days before computers had video screens).
# For this exercise, write a one-line program that creates the following output
# 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

# 10.times { |indent| puts 'The Flintstones Rock!'.prepend(' ' * indent) }
# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


# Question 2
# Create a hash that expresses the frequency with which each
# letter occurs in this string:

statement = "The Flintstones Rock"
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
letter_freq = {}
statement.chars.sort.uniq.each do |l|
  letter_freq[l] = statement.count l unless l.match /\W/
end

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end


# Question 3
# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# Answer:
# Because Ruby cannot implicitly convert a Fixnum into a String
# To fix this you could use #{} and put the (40 + 2) in side that


# Question 4
# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  #p number
  numbers.shift(1)
end
# What would be output by this code?
1
3


numbers = [1, 2, 3, 4]
numbers.each do |number|
  #p number
  numbers.pop(1)
end
1
2


# Question 5
# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop.
# How can you change the loop construct (instead of using begin/end/until) to make this work?
# Note that we're not looking to find the factors for 0 or negative numbers,
# but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
  end
  divisors
end

# Bonus 1
# What is the purpose of the number % dividend == 0 ?
# To see if the number is evenly divisible by the dividend

# Bonus 2
# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
# To return the divisors from the function


# Question 6
# Alyssa was asked to write an implementation of a rolling buffer.
# Elements are added to the rolling buffer and if the buffer becomes full,
# then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick.
# Do you like << or + for modifying the buffer?".
# Is there a difference between the two, other than what operator
# she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# The << modified the array passed into the function, and returns it
# Using + and = will not modify the array passed in, but only return a new array


# Question 7
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator,
# A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error.
# Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

# result = fib(0, 1)
# puts "result is #{result}"
# How would you fix this so that it works?

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
# puts "result is #{result}"


# Question 8
# In another example we used some built-in string methods to change the case of a string.
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize!
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
# For example, the string:

words = "the flintstones rock"
# would be:

words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end


# Question 9
# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional "age_group" key
# that has one of three values describing the age group the family member is in (kid, adult, or senior).
# Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# hint: try using a case statement along with Ruby Range objects in your solution

munsters.each do |k, v|
  age = v['age']
  age_group = case
  when (0..17).cover?(age) then 'kid'
  when (18..64).cover?(age) then 'adult'
  when (64..Float::INFINITY).cover?(age) then 'senior'
  end
  v.merge!({ "age_group" => age_group })
end

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
