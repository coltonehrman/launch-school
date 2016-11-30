# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

numbers

# Answer:
# 1
# 2
# 2
# 3


# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
#
# what is != and where should you use it?
# put ! before something, like !user_name
# put ! after something, like words.uniq!
# put ? before something
# put ? after something
# put !! before something, like !!user_name

# Answer:
# != is used in conditionals and means not equal to
# ! before something returns the opposite boolean value
# ! after something is used in method names to denote the method is destructive or modifies the caller
# ? before something is used in ternary conditional statements
# ? after something is used in method names to denote the method returns a boolean value
# !! before something returns the boolean value


# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# Answer:
advice.gsub! 'important', 'urgent'


# Question 4
# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
# What do the following method calls do (assume we reset numbers to the original array between method calls)?

# Answer:
numbers.delete_at(1)
# numbers => [1, 3, 4, 5]
numbers.delete(1)
# numbers => [2, 3, 4, 5]


# Question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.

# Answer:
(10..100).cover? 42


# Question 6
# Starting with the string:

famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.

# Answer:
"Four score and " << famous_words
"Fours score and " + famous_words
famous_words.prepend "Fours score and "


# Question 7
# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

how_deep
# This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
# If we take advantage of Ruby's Kernel#eval method to have it
# execute this string as if it were a "recursive" method call

eval(how_deep)
# what will be the result?

# Answer:
42


# Question 8
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.

# Answer:
flintstones.flatten!


# Question 9
# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements:
# Barney's name and Barney's number

# Answer:
flintstones.assoc 'Barney'


# Question 10
# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys
# and the values are the positions in the array.
flintstones.map! do |name|
  [ name, flintstones.index(name) ]
end

p flintstones = flintstones.to_h
