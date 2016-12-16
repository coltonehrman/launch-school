class RPSGame
  attr_accessor :human, :computer
  GOAL = 10

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      game_loop
      break if game_over? || !play_again?
    end
    puts "\n"
    puts "Winner is #{winner}" if game_over?
    display_goodbye_message
  end

  private

  def game_loop
    puts "\n"
    human.choose
    computer.choose(human.moves)
    puts "\n"
    display_moves
    display_round_result
    puts "\n"
    display_scores
  end

  def play_again?
    answer = nil
    loop do
      puts "\n"
      print "Would you like to play again (y/n)? "
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def display_welcome_message
    puts "Welcome to #{Move::MOVES.join(', ')}!"
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::MOVES.join(', ')}. Goodbye #{human}!"
  end

  def display_moves
    puts "#{human} chose: #{human.move}"
    puts "#{computer} chose: #{computer.move}"
  end

  def display_round_result
    if human.move > computer.move
      human_won
    elsif computer.move > human.move
      computer_won
    else
      puts "It's a tie!"
    end
  end

  def display_scores
    puts "#{human}: #{human.score}"
    puts "#{computer}: #{computer.score}"
  end

  def game_over?
    human.score == GOAL || computer.score == GOAL
  end

  def winner
    if human.score == GOAL
      human
    elsif computer.score == GOAL
      computer
    end
  end

  def human_won
    human.won
    computer.lost
  end

  def computer_won
    human.lost
    computer.won
  end
end
