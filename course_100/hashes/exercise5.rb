# What method could you use to find out if a Hash contains a specific value in it?
# Write a program to demonstrate this use.

# Answer: has_value?

hsh = {
  a: 100,
  b: 200,
  c: 300,
  d: 499
}

puts hsh.has_value?(499)
puts hsh.has_value?(199)
