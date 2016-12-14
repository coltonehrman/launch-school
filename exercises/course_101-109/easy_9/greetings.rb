def greetings(name, info)
  puts "Hello, #{name.join(' ')}! Nice to have a #{info[:title]} #{info[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.
