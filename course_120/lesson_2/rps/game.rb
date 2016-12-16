class RPSGame
  attr_reader :human, :computer
  GOAL = 5

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
    display_line_break
    display_winner
    display_goodbye_message
  end

  private

  def game_loop
    display_line_break

    human.choose
    computer.choose

    display_line_break

    display_moves

    display_line_break

    display_round_result
    display_scores
  end

  def play_again?
    answer = nil
    loop do
      puts "\n"
      print "Would you like to play again (y/n)? "
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be Y/y or N/n."
    end
    answer == 'y'
  end

  def display_line_break
    puts "\n"
  end

  def display_welcome_message
    display_line_break
    puts "Welcome to #{Move.moves.join(', ')}!"
    puts "First player to reach a score of #{GOAL} wins!"
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move.moves.join(', ')}. Goodbye #{human}!"
  end

  def display_moves
    puts "#{human} chose: #{human.move}"
    puts "#{computer} chose: #{computer.move}"
  end

  def display_round_result
    if human.move > computer.move
      Player.record_hisory(human, computer)
    elsif computer.move > human.move
      Player.record_hisory(computer, human)
    else
      puts "It's a tie!"
    end
  end

  def display_scores
    puts "#{human}: #{human.score}"
    puts "#{computer}: #{computer.score}"
  end

  def display_winner
    puts "Winner is #{winner}!" if game_over?
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
end
