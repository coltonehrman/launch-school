print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip_percent = gets.chomp.to_f / 100
tip = bill * tip_percent


puts "The tip is $#{tip.round(2)}"
puts "The total is $#{(bill + tip).round(2)}"
