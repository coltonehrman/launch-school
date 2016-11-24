# Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". Each loop can get info from the user.

loop do
  print "Enter something: "
  input = gets.chomp
  if input == "STOP"
    break
  end
end
