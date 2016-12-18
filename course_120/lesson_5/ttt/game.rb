class TTTGame
  attr_reader :board, :human, :computer
  GOAL = 2
  HUMAN_MARKER = 'O'.freeze
  COMPUTER_MARKER = 'X'.freeze
  FIRST_PLAYER_MARKER = HUMAN_MARKER

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = first_player
  end

  def play
    clear
    display_welcome_message
    loop do
      game_loop
      display_result
      break if game_over?
      break unless play_again?
      reset
      display_play_again_message
    end
    display_game_result if game_over?
    display_newline
    display_goodbye_message
  end

  private

  def game_loop
    loop do
      display_board
      display_score
      current_player_moves
      break if board.someone_won? || board.full?
      clear
    end
  end

  def first_player
    case FIRST_PLAYER_MARKER
    when HUMAN_MARKER then human
    when COMPUTER_MARKER then computer
    end
  end

  def current_player_moves
    human_moves if @current_player == human
    computer_moves if @current_player == computer
    @current_player = @current_player == human ? computer : human
  end

  def human_moves
    square = nil
    loop do
      print "Choose a square between (#{joiner(board.unmarked_keys)}): "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    spot = board.spots_to_win(COMPUTER_MARKER).first
    spot ||= board.spots_to_win(HUMAN_MARKER).first
    if spot
      board[spot] = computer.marker
    else
      computer_alt_move
    end
  end

  def computer_alt_move
    spots = board.unmarked_keys
    board[5] = computer.marker if spots.include?(5)
    board[spots.sample] = computer.marker unless spots.include?(5)
  end

  def game_over?
    human.score == GOAL ||
      computer.score == GOAL
  end

  def play_again?
    answer = nil
    loop do
      display_newline
      print "Would you like to play again (y/n)? "
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, you must enter either y or n."
    end
    answer == 'y'
  end

  def reset
    clear
    board.reset
    @current_player = first_player
  end

  def display_board
    puts "You're #{human.marker}. Computer is #{computer.marker}"
    display_newline
    board.draw
    display_newline
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts "First player to win #{GOAL} games wins!"
  end

  def display_result
    clear
    display_board
    case board.winning_marker
    when human.marker
      human.won
      puts "You won!"
    when computer.marker
      computer.won
      puts "Computer won!"
    else
      puts "It was a tie!"
    end
    display_score
  end

  def display_score
    puts "You: #{human.score} | Computer: #{computer.score}"
  end

  def display_play_again_message
    puts "Let's play again!"
  end

  def display_game_result
    winner = nil
    winner = human if human.score == GOAL
    winner = computer if computer.score == GOAL

    case winner
    when human
      puts "You beat the computer!"
    when computer
      puts "The computer beat you!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Tic-Tac-Toe! Goodbye!"
    display_newline
  end

  def joiner(items, delimiter = ',', end_word = 'or')
    joined = items.join("#{delimiter} ")
    joined.reverse.sub(delimiter, "#{end_word.reverse} ").reverse
  end

  def display_newline
    puts "\n"
  end

  def clear
    system('clear')
  end
end
