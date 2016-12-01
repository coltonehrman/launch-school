require 'pry'

VALID_CHOICES = {
  word: %w(rock paper scissors lizard spock),
  letter: %w(r p sc l sp)
}

RULES = {
  'r' => %w(sc l),
  'p' => %w(r sp),
  'sc' => %(p l),
  'l' => %w(p sp),
  'sp' => %w(r sc)
}

def valid_choice?(choice)
  choice = choice.downcase()
  VALID_CHOICES[:word].include?(choice) ||
    VALID_CHOICES[:letter].include?(choice)
end

def formatted_choice(choice)
  choice = choice.downcase()
  letter_index = VALID_CHOICES[:letter].index(choice)
  return VALID_CHOICES[:word][letter_index].capitalize() if letter_index
  choice.capitalize()
end

def win?(first, second)
  RULES[first].include?(second)
  # (first == 'r' && (second == 'sc' || second == 'l')) ||
  #   (first == 'p' && (second == 'r' || second == 'sp')) ||
  #   (first == 'sc' && (second == 'p' || second == 'l')) ||
  #   (first == 'l' && (second == 'p' || second == 'sp')) ||
  #   (first == 'sp' && (second == 'r' || second == 'sc'))
end

def choice_char(input)
  output = input.chars().first.downcase()
  output = input.chars()[0, 2].join().downcase() if input.start_with?('S')
  output
end

def find_outcome(user, computer)
  user = choice_char(user)
  computer = choice_char(computer)

  if win?(user, computer) then 'win'
  elsif win?(computer, user) then 'lose'
  else 'tie'
  end
end

def show_score(score)
  Kernel.puts()
  Kernel.puts("\tSCORE:")
  Kernel.puts("########################")
  Kernel.puts("You\t|\tComputer")
  Kernel.puts("#{score[:user]}\t\t#{score[:computer]}")
end

def play_again?
  loop do
    Kernel.print("Would you like to play again (y/n)? ")
    play_again = Kernel.gets().chomp().downcase()

    return true if play_again.start_with?('y')
    return false if play_again.start_with?('n')

    next
  end
end

def show_title
  title = VALID_CHOICES[:word].map(&:capitalize)
  title = title.join(', ')
  Kernel.print("\t##### ")
  Kernel.print("#{title} (BONUS EDITION)")
  Kernel.puts(" #####")
end

Kernel.puts()
Kernel.puts("\t#{'#' * 64}")
show_title()
Kernel.puts("\t#{'#' * 64}")

score = {
  user: 0,
  computer: 0
}

loop do
  Kernel.print("\nChoose (R)ock, (P)aper, (Sc)issors, (L)izard, or (Sp)ock: ")
  user_choice = Kernel.gets().chomp()

  if valid_choice?(user_choice)
    user_choice = formatted_choice(user_choice)
    Kernel.puts("\nYou chose: #{user_choice}")
  else
    Kernel.puts("Invalid choice!")
    next
  end

  computer_choice = formatted_choice(VALID_CHOICES[:word].sample())

  Kernel.puts("Computer chose: #{computer_choice}")

  outcome = find_outcome(user_choice, computer_choice)

  case outcome
  when 'win'
    Kernel.puts("Yay! You beat the computer!")
    score[:user] += 1
  when 'lose'
    score[:computer] += 1
    Kernel.puts("Awww... You lost.")
  else
    Kernel.puts("It was a tie.")
  end

  show_score(score)
  next if play_again?()

  break
end
