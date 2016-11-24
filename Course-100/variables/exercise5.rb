# Look at the following programs...

x = 0
3.times do
  x += 1
end
puts x

# and...

y = 0
3.times do
  y += 1
  x = y
end
puts x

# What does x print to the screen in each case? Do they both give errors? Are the errors different? Why?

# Case 1:
# 3

# Case 2:
# Error, because on line 16 it is trying to access a variable that is not in scope
# x is within the do/end block and cannot be accessed outside of it
