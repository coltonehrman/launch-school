# Write a program that takes a number from the user between 0 and 100 and
# reports back whether the number is between 0 and 50, 51 and 100, or above 100.

print "Enter a number between 0 and 100: "
num = gets.chomp.to_i

case
when num < 0
  puts "Negative number entered."
when num <= 50
  puts "Number is between 0 and 50."
when num <= 100
  puts "Number is between 51 and 100."
else
  puts "Number is greater than 100."
end
