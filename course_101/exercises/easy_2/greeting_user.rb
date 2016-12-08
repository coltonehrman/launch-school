print "What is your name? "
name = gets.chomp

if name.include?('!')
  puts "Hello #{name.gsub('!', '')}. Why are you screaming?".upcase
else
  puts "Hello #{name}."
end
