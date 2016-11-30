require 'pry'

VALID_CHOICES = {
  word: %w(rock paper scissors lizard spock),
  letter: %w(r p sc l sp)
}

def valid_choice?(choice)
  choice = choice.downcase
  VALID_CHOICES[:word].include?(choice) ||
    VALID_CHOICES[:letter].include?(choice)
end

def formatted_choice(choice)
  choice = choice.downcase
  letter_index = VALID_CHOICES[:letter].index choice
  letter_index ? VALID_CHOICES[:word][letter_index].capitalize : choice.capitalize
end

def win?(first, second)
  (first == 'r' && (second == 'sc' || second == 'l')) ||
    (first == 'p' && (second == 'r' || second == 'sp')) ||
    (first == 'sc' && (second == 'p' || second == 'l')) ||
    (first == 'l' && (second == 'p' || second == 'sp')) ||
    (first == 'sp' && (second == 'r' || second == 'sc'))
end

def find_outcome(user, computer)
  user = user == 'Spock' ? 'sp' : user.chars.first.downcase
  computer = computer == 'Spock' ? 'sp' : computer.chars.first.downcase

  if win?(user, computer) then 'win'
  elsif win?(computer, user) then 'lose'
  else 'tie'
  end
end

def show_score(score)
  Kernel.puts "\n\tSCORE:\n\
########################\n\
You\t|\tComputer\n\
#{score[:user]}\t\t#{score[:computer]}"
end

Kernel.puts "\n\t#################################\
\n\t##### Rock, Paper, Scissors, Lizard, Spock (BONUS EDITION) #####\n\t\
#################################"

score = {
  user: 0,
  computer: 0
}

loop do
  Kernel.print "\nChoose (R)ock, (P)aper, (Sc)issors, (L)izard, or (Sp)ock: "
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
    score[:user] += 1
  when 'lose'
    score[:computer] += 1
    Kernel.puts "Awww... You lost."
  else
    Kernel.puts "It was a tie."
  end

  show_score score
  next if loop do
    Kernel.print "Would you like to play again (y/n)? "
    play_again = Kernel.gets.chomp.downcase

    break true if play_again.start_with? 'y'
    break false if play_again.start_with? 'n'

    next
  end

  break
end
