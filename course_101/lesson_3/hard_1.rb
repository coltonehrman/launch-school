# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# greeting is nil here, and no "undefined method or local variable" exception is thrown.
# Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined.
# However, when you initialize a local variable within an if block, even if that if block doesn’t get executed,
# the local variable is initialized to nil.


# Question 2
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings  #  => { a: 'hi there' }

# The output is {:a=>"hi there"}. The reason is because informal_greeting is a reference to the original object.
# The line informal_greeting << ' there' was using the String#<< method, which modifies the object that called it.
# This means that the original object was changed, thereby impacting the value in greetings.
# If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings,
# there are a couple of options:

# we could initialize informal_greeting with a reference to a new object containing the same value by
# informal_greeting = greetings[:a].clone
# we can use string concatenation,
# informal_greeting = informal_greeting + ' there'
# which returns a new String object instead of modifying the original object.


# Question 3
# In other exercises we have looked at how the scope of variables affects the
# modification of one "layer" when they are passed to another.
# To drive home the salient aspects of variable scope and modification of one scope by another,
# consider the following similar sets of code.
# What will be printed by each of these code groups?

# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

# puts "one is: #{one}"  #  => "one"
# puts "two is: #{two}"  #  => "two"
# puts "three is: #{three}"  #  => "three"

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

# puts "one is: #{one}"  #  => "one"
# puts "two is: #{two}"  #  => "two"
# puts "three is: #{three}"  #  => "three"

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

# puts "one is: #{one}"  #  => "two"
# puts "two is: #{two}"  #  => "three"
# puts "three is: #{three}"  #  => "one"


# Question 4
# A UUID is a type of identifier often used as a way to uniquely identify items...
# which may not all be created by the same system. That is, without any form of synchronization,
# two or more separate computer systems can create new items and label them with a UUID with
# no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters,
# and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def make_uuid
  uuid_chars = ('a'..'f').to_a + ('0'..'9').to_a
  sections = [8, 4, 4, 4, 12]
  sections.map do |num|
    chars = ''
    num.times() { chars += "#{uuid_chars.sample()}" }
    chars
  end.join('-')
end

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end


# Question 5
# Ben was tasked to write a simple ruby method to determine if an input string is an
# IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions.
# Alyssa supplied Ben with a method called is_an_ip_number? that determines
# if a string is a valid ip address number and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
# You're not returning a false condition, and you're not handling the case that
# there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def is_valid_ip_address?(input)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p is_valid_ip_address?('4.5.5')
