begin
  puts ">> Please enter an integer greater than 0:"
  int = gets.chomp
end until int.to_i.to_s == int && int.to_i > 0
int = int.to_i
puts ">> Enter 's' to computer sum, or 'p' to computer the product."
calc = gets.chomp

result = case calc
when 's'
  (1..int).reduce(&:+)
when 'p'
  (1..int).reduce(&:*)
end

case calc
when 's'
  puts "The sum of the integers between 1 and #{int} is #{result}"
when 'p'
  puts "The product of the integers between 1 and #{int} is #{result}"
end
