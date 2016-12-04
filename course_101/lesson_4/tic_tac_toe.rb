require 'pry'

VERTICAL_CHAR   = '|'.freeze
HORIZONTAL_CHAR = '-'.freeze
INTERSECT_CHAR  = '#'.freeze
CELL_PADDING    = 7 # Must be odd

CORNERS = [1, 3, 7, 9].freeze
OPPOSITE_CORNER = { 1 => 9, 3 => 7, 7 => 3, 9 => 1 }.freeze

WINNING_GROUPS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
].freeze

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def print_empty_row
  print "#{' ' * CELL_PADDING}#{VERTICAL_CHAR}\
#{' ' * CELL_PADDING}#{VERTICAL_CHAR}#{' ' * CELL_PADDING}\t\t"
end

def print_empty_rows(num)
  print "\t"
  num.times { print_empty_row }
  print "\n"
end

def print_border_row
  print "#{HORIZONTAL_CHAR * CELL_PADDING}\
#{INTERSECT_CHAR}#{HORIZONTAL_CHAR * CELL_PADDING}\
#{INTERSECT_CHAR}#{HORIZONTAL_CHAR * CELL_PADDING}\t\t"
end

def print_border_rows(num)
  print "\t"
  num.times { print_border_row }
  print "\n"
end

def print_square(square)
  print "#{' ' * (CELL_PADDING / 2)}\
#{square}\
#{' ' * (CELL_PADDING / 2)}"
end

def print_board(row, type)
  print "\t"
  row.each_with_index do |col, index|
    if type == :spots
      col[1] == ' ' ? print_square(col[0]) : print_square(' ')
    else
      print_square(col[1])
    end
    print VERTICAL_CHAR unless index == 2
  end
  print "\t"
end

def print_board_titles(first, second)
  print "\n\t"
  title = first.center(CELL_PADDING * 3 + 2)
  print "#{title}\t\t"
  title = second.center(CELL_PADDING * 3 + 2)
  print "#{title}\n\n"
end

def display_boards(brd)
  print_board_titles("GAME BOARD", "SPOTS LEFT")
  rows_and_columns(brd).each_with_index do |row, index|
    print_empty_rows(2)

    print_board(row, :game)
    print_board(row, :spots)
    puts "\n"

    print_empty_rows(2)
    print_border_rows(2) unless index == 2
  end
  puts "\n"
end

def display_report(winner, markers)
  puts '#' * 24
  puts "*** YAY! YOU WON! :) ***" if winner == markers[:player]
  puts "*** Aww... You Lost! ***" if winner == markers[:computer]
  puts "*** It was a tie.... ***" if winner.nil?
  puts '#' * 24
end

def rows_and_columns(brd)
  brd.to_a.each_slice(3).to_a
end

def spots_left(brd)
  brd.select { |_, v| v == ' ' }
end

def place_piece!(brd, player, markers)
  player_plays!(brd, markers[player]) if player == :player
  computer_plays!(brd, markers) if player == :computer
end

def player_plays!(brd, marker)
  loop do
    print "Where would you like to play?\n\
(choose a number from the SPOTS LEFT board on your right): "
    answer = gets.chomp.to_i

    if brd[answer] != ' '
      puts "** Invalid Choice **"
      puts "\n"
      next
    end

    brd[answer] = marker
    return
  end
end

def spot_to_win(brd, marker)
  WINNING_GROUPS.each do |winning_squares|
    other_marker = marker == 'X' ? 'O' : 'X'
    values_at_squares = brd.values_at(*winning_squares)
    squares = values_at_squares - [marker]
    if !squares.include?(other_marker) && squares.size == 1
      return winning_squares[values_at_squares.index(' ')]
    end
  end
  nil
end

def get_spot_from_value(brd, value)
  brd.select { |_, v| v == value }.keys.last
end

def computer_plays!(brd, markers)
  spot = spot_to_win(brd, markers[:computer])
  spot ||= spot_to_win(brd, markers[:player])
  spot ||= 5 if spots_left(brd).include?(5)
  spot ||= spots_left(brd).keys.sample
  brd[spot] = markers[:computer]
end

def find_winner(brd)
  WINNING_GROUPS.each do |winning_squares|
    values_at_squares = brd.values_at(*winning_squares)
    return 'X' if values_at_squares == ['X', 'X', 'X']
    return 'O' if values_at_squares == ['O', 'O', 'O']
  end
  nil
end

def board_full?(brd)
  (brd.values - ['X', 'O']).size.zero?
end

def clear_screen
  system('clear')
end

def pick_marker
  loop do
    print "Which marker would you like to be (X/O)? "
    marker = gets.chomp.downcase

    next unless marker == 'x' || marker == 'o'

    player_marker = marker.upcase
    computer_marker = player_marker == 'X' ? 'O' : 'X'

    return { player: player_marker, computer: computer_marker }
  end
end

def pick_starter
  loop do
    print "Do you want to play first move (Y/n)? "
    answer = gets.chomp.downcase
    next unless answer == 'y' || answer == 'n'
    return answer == 'y' ? :player : :computer
  end
end

def play_game(current_player, markers)
  board = initialize_board

  winner = loop do
    clear_screen
    display_boards(board)

    place_piece!(board, current_player, markers)
    current_player = current_player == :player ? :computer : :player

    winner = find_winner(board)
    break winner if winner || board_full?(board)
  end

  clear_screen
  display_boards(board)
  display_report(winner, markers)
end

def play_again?
  loop do
    print "Would you like to play again (Y/n)? "
    answer = gets.chomp.downcase
    return answer == 'y' if answer == 'y' || answer == 'n'
  end
end

def start
  loop do
    clear_screen
    markers = pick_marker
    play_game(pick_starter, markers)
    break unless play_again?
  end
end

start
