class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]].freeze
  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |            |     |"
    print "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}   "
    puts "   #{spot(1)}  |  #{spot(2)}  |  #{spot(3)}  "
    puts "     |     |            |     |     "
    puts "-----+-----+-----  -----+-----+-----"
    puts "     |     |            |     |     "
    print "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}   "
    puts "   #{spot(4)}  |  #{spot(5)}  |  #{spot(6)}  "
    puts "     |     |            |     |     "
    puts "-----+-----+-----  -----+-----+-----"
    puts "     |     |            |     |     "
    print "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}   "
    puts "   #{spot(7)}  |  #{spot(8)}  |  #{spot(9)}  "
    puts "     |     |            |     |     "
  end
  # rubocop:enable Metrics/AbcSize

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    !WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if all_identical_markers?(squares)
    end
  end

  def spots_to_win(marker)
    spots = []
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if about_to_win?(marker, squares)
        empty_square = squares.collect(&:marker).index(" ")
        spots << line[empty_square]
      end
    end
    spots
  end

  private

  def all_identical_markers?(squares)
    squares.all?(&:marked?) &&
      squares.collect(&:marker).uniq.count == 1
  end

  def about_to_win?(marker, squares)
    marks = squares.collect(&:marker)
    markers = marks.count(marker)
    empty_squares = marks.count(Square::INITIAL_MARKER)
    markers == 2 && empty_squares == 1
  end

  def spot(pos)
    initial = Square::INITIAL_MARKER
    @squares[pos].marker == initial ? pos : initial
  end
end
