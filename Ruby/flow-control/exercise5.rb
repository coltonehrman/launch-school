# Rewrite your program from exercise 3 using a case statement.
# Wrap the statement from exercise 3 in a method and wrap this
# new case statement in a method. Make sure they both still work.

def find_number
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
end

find_number
