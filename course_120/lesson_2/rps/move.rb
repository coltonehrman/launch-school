class Move
  MOVES = %w(Rock Paper Scissors Lizard Spock).freeze

  def self.show_moves
    MOVES.join(', ').reverse.sub(',', ' or'.reverse).reverse
  end

  def self.valid_move(move)
    MOVES.map(&:downcase).include?(move.downcase)
  end

  def self.new_move(move)
    if valid_move(move)
      Object.const_get(move.capitalize).new
    end
  end

  def to_s
    self.class.to_s
  end
end
