VALID_CHOICES = [['rock', 'paper', 'scissors'], ['r', 'p', 's']]

Kernel.puts "\n\t#################################\n\t##### Rock, Paper, Scissors #####\n\t#################################"

def valid_choice(choice)
  choice = choice.downcase
  ( choice.size > 1 && VALID_CHOICES[0].include?(choice) ) || ( VALID_CHOICES[1].include?(choice) )
end

def choice_formatted(choice)
  choice = choice.downcase
  letter_index = VALID_CHOICES[1].index choice
  ( letter_index ) ? VALID_CHOICES[0][letter_index].capitalize : choice.capitalize
end

def find_outcome(user, computer)
  user = user[0].downcase
  computer = computer[0].downcase

  if user == computer
    'tie'
  elsif (user == 'r' && computer == 's') ||
    (user == 'p' && computer == 'r') ||
    (user == 's' && computer == 'p')
    'win'
  else
    'lose'
  end
end

loop do
  Kernel.print "\nChoose (R)ock, (P)aper, or (S)cissors: "
  user_choice = Kernel.gets.chomp

  if valid_choice user_choice
    user_choice = choice_formatted(user_choice)
    Kernel.puts "\nYou chose: #{user_choice}"
  else
    Kernel.puts "Invalid choice!"
    next
  end

  computer_choice = choice_formatted(VALID_CHOICES[0].sample)

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

  next if loop do
    Kernel.print "\nWould you like to play again? "
    play_again = Kernel.gets.chomp.downcase

    break true if play_again.start_with? 'y'
    break false
  end

  break
end
