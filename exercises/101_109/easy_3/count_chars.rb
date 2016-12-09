puts "==> Please write word or multiple words:"
input = gets.chomp

p input.gsub(/\s+/, '').chars.count
