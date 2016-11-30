# Look at Ruby's merge method. Notice that it has two versions.
# What is the difference between merge and merge!?
# Write a program that uses both and illustrate the differences.

# Answer:
# merge does NOT modify the caller and returns hash
# merge! does modify the caller and returns it

h1 = { "a" => 100, "b" => 200 }
h2 = { "c" => 254, "d" => 300 }

h1_and_h2 = h1.merge(h2)
puts "h1 is #{h1}", "h2 is #{h2}", "h1_and_h2 is #{h1_and_h2}"

h3 = h1.merge!(h2)
puts "\n", "h1 is #{h1}", "h2 is #{h2}", "h2 is #{h3}"
