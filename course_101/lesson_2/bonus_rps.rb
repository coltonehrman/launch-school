VALID_CHOICES = {
  word: %w(rock paper scissors),
  letter: %w(r p s)
}

Kernel.puts "\n\t#################################\
\n\t##### Rock, Paper, Scissors #####\n\t\
#################################"

def valid_choice?(choice)
  choice = choice.downcase
  (VALID_CHOICES[:word].include?(choice)) || (VALID_CHOICES[:letter].include?(choice))
end

def formatted_choice(choice)
  choice = choice.downcase
  letter_index = VALID_CHOICES[:letter].index choice
  letter_index ? VALID_CHOICES[:word][letter_index].capitalize : choice.capitalize
end

def win?(first, second)
  (first == 'r' && second == 's') ||
    (first == 'p' && second == 'r') ||
    (first == 's' && second == 'p')
end

def find_outcome(user, computer)
  user = user.chars.first.downcase
  computer = computer.chars.first.downcase

  if win?(user, computer) then 'win'
  elsif win?(computer, user) then 'lose'
  else 'tie'
  end
end

loop do
  Kernel.print "\nChoose (R)ock, (P)aper, or (S)cissors: "
  user_choice = Kernel.gets.chomp

  if valid_choice? user_choice
    user_choice = formatted_choice(user_choice)
    Kernel.puts "\nYou chose: #{user_choice}"
  else
    Kernel.puts "Invalid choice!"
    next
  end

  computer_choice = formatted_choice(VALID_CHOICES[:word].sample)

  Kernel.puts "Computer chose: #{computer_choice}"

  outcome = find_outcome user_choice, computer_choice

  case outcome
  when 'win'
    Kernel.puts "Yay! You beat the computer!"
  when 'lose'
    Kernel.puts "Awww... You lost."
  else
    Kernel.puts "It was a tie."
  end

  Kernel.puts ''
  next if loop do
    Kernel.print "Would you like to play again (y/n)? "
    play_again = Kernel.gets.chomp.downcase

    break true if play_again.start_with? 'y'
    break false if play_again.start_with? 'n'

    next
  end

  break
end
