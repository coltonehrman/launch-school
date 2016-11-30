# Write a method that takes a string as argument.
# The method should return the all-caps version of the string,
# only if the string is longer than 10 characters.
# Example: change "hello world" to "HELLO WORLD".
# (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

def all_caps_if_long(string)
  return string.to_s.length > 10 ? string.to_s.upcase : string
end

puts all_caps_if_long("hello world")
