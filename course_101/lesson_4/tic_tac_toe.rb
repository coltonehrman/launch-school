require 'pry'

BOARD_MAP = [%w(1 2 3), %w(4 5 6), %w(7 8 9)].freeze

VERTICAL_CHAR   = '|'.freeze
HORIZONTAL_CHAR = '-'.freeze
INTERSECT_CHAR  = '#'.freeze
CELL_PADDING    = 7 # Must be odd

PLAYER_MARKER   = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

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

def print_spot(cell)
  print "#{' ' * (CELL_PADDING / 2)}\
#{cell.index(/[X|O]/) ? ' ' : cell}\
#{' ' * (CELL_PADDING / 2)}"
end

def print_cell(cell)
  print "#{' ' * (CELL_PADDING / 2)}\
#{cell.index(/[X|O]/) ? cell : ' '}\
#{' ' * (CELL_PADDING / 2)}"
end

def print_board(row, type)
  print "\t"
  row.each_with_index do |cell, cindex|
    print_cell(cell) if type == :game
    print_spot(cell) if type == :spots
    print VERTICAL_CHAR unless cindex == 2
  end
  print "\t"
end

def print_board_titles(title1, title2)
  print "\n\t"
  title1 = title1.center(CELL_PADDING * 3 + 2)
  print "#{title1}\t\t"
  title2 = title2.center(CELL_PADDING * 3 + 2)
  print "#{title2}\n\n"
end

def display_boards(board)
  board = board.each_slice(3).to_a

  print_board_titles("GAME BOARD", "SPOTS LEFT")
  board.each_with_index do |row, rindex|
    print_empty_rows(2)

    print_board(row, :game)
    print_board(row, :spots)
    print "\n"

    print_empty_rows(2)
    print_border_rows(2) unless rindex == 2
  end
  puts "\n"
end

def player_plays!(board)
  loop do
    print "Where would you like to play?\n\
(choose a number from the SPOTS LEFT board on your right): "
    answer = gets.chomp

    unless board.include?(answer)
      puts "** Invalid Choice **"
      puts "\n"
      next
    end

    board[board.index(answer)] = PLAYER_MARKER
    return
  end
end

def players_spots(board)
  x_spots, o_spots = rows_and_columns(board)
  PLAYER_MARKER == 'X' ? x_spots : o_spots
end

def computers_spots(board)
  x_spots, o_spots = rows_and_columns(board)
  COMPUTER_MARKER == 'X' ? x_spots : o_spots
end

def about_to_win?(board, spots)
  rows = spots[:rows]
  cols = spots[:columns]
  return false if rows.empty? || cols.empty?
  marker = board.each_slice(3).to_a[rows.first][cols.first]
  other_marker = marker == 'X' ? 'O' : 'X'

  closest_row = most_in_array(rows)
  closest_col = most_in_array(cols)

  ((get_row(board, closest_row) - [marker]).size == 1 && (!get_row(board, closest_row).include?(other_marker))) ||
    ((get_column(board, closest_col) - [marker]).size == 1 && (!get_column(board, closest_col).include?(other_marker)))
end

def spot_to_win(board, spots)
  rows = spots[:rows]
  cols = spots[:columns]

  marker = board.each_slice(3).to_a[rows.first][cols.first]
  other_marker = marker == 'X' ? 'O' : 'X'

  row_with_most = most_in_array(rows)
  col_with_most = most_in_array(cols)

  row_to_win = (get_row(board, row_with_most) - [marker])
  col_to_win = (get_column(board, col_with_most) - [marker])

  result = row_to_win.first if row_to_win.size == 1 && !row_to_win.include?(other_marker)
  result = col_to_win.first if col_to_win.size == 1 && !col_to_win.include?(other_marker)
  result
end

def get_row(board, row)
  board.each_slice(3).to_a[row]
end

def row_is_full?(board, row)
  row = get_row(board, row)
  (row - [PLAYER_MARKER, COMPUTER_MARKER]).size.zero?
end

def get_column(board, column)
  board.each_slice(3).to_a.map { |row| row[column] }
end

def col_is_full?(board, col)
  col = get_column(board, col)
  (col - [PLAYER_MARKER, COMPUTER_MARKER]).size.zero?
end

def computer_plays!(board)
  spots_left = (board & BOARD_MAP.flatten)
  player = players_spots(board)
  computer = computers_spots(board)
  spot = if about_to_win?(board, computer)
           spot_to_win(board, computer)
         elsif about_to_win?(board, player)
           spot_to_win(board, player)
         end
  spot ||= spots_left.sample
  board[board.index(spot)] = COMPUTER_MARKER
end

def board_full?(board)
  (board & BOARD_MAP.flatten).empty?
end

def most_in_array(arr)
  arr.max_by { |i| arr.count(i) }
end

def rows_and_columns(board)
  x_spots = { rows: [], columns: [] }
  o_spots = { rows: [], columns: [] }
  board.each_slice(3).to_a.each_with_index do |row, rindex|
    row.each_with_index do |column, cindex|
      case column
      when 'X'
        x_spots[:rows] << rindex
        x_spots[:columns] << cindex
      when 'O'
        o_spots[:rows] << rindex
        o_spots[:columns] << cindex
      end
    end
  end
  [x_spots, o_spots]
end

def diagonal_win?(board)
  diag_down = [0, 4, 8]
  diag_up = [6, 4, 2]
  (board.values_at(*diag_down).uniq.size == 1 ||
    board.values_at(*diag_up).uniq.size == 1)
end

def win?(spots)
  rows = spots[:rows]
  cols = spots[:columns]
  (rows.count(most_in_array(rows)) >= 3 ||
    cols.count(most_in_array(cols)) >= 3)
end

def someone_won?(board)
  if board.count('X') >= 3 || board.count('O') >= 3
    x_spots, o_spots = rows_and_columns(board)
    win?(x_spots) || win?(o_spots) || diagonal_win?(board)
  end
end

def find_winner(board)
  if someone_won?(board)
    x_spots, o_spots = rows_and_columns(board)
    if diagonal_win?(board) then return board[4]
    elsif win?(x_spots) then return 'X'
    elsif win?(o_spots) then return 'O'
    end
  end
end

def play_game
  game_board = BOARD_MAP.flatten

  loop do
    display_boards(game_board)

    player_plays!(game_board)
    break if someone_won?(game_board) || board_full?(game_board)

    computer_plays!(game_board)
    break if someone_won?(game_board) || board_full?(game_board)
  end

  display_boards(game_board)
  winner = find_winner(game_board)
  puts winner ? "Winner is #{winner}" : "It was a tie..."
end

def play_again?
  loop do
    print "Would you like to play again (Y/n)? "
    answer = gets.chomp.downcase
    next if answer != 'y' && answer != 'n'
    break answer == 'y'
  end
end

def start
  loop do
    play_game
    next if play_again?
    break
  end
end

start
