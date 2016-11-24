# What's the difference between the two hashes that were created?

x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# Answer:
# my_hash's key is "x"
# my_hash2's key is "hi there" because it was set using a variable instead of a symbol
