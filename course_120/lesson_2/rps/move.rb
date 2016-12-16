class Move
  MOVES = %w((R)ock (P)aper (Sc)issors (L)izard (Sp)ock).freeze

  class << self
    def show_moves
      MOVES.join(', ').reverse.sub(',', ' or'.reverse).reverse
    end

    def moves
      MOVES.join(' ').gsub(/\(|\)/, '').split
    end

    def valid_move(move)
      get_moves_from_string(move).count == 1
    end

    def new_move(move)
      if valid_move(move)
        Object.const_get(get_move_class(move)).new
      end
    end

    private

    def get_moves_from_string(string)
      moves.map(&:downcase).select do |move|
        index = move.index(string.downcase)
        !index.nil? && index.zero?
      end
    end

    def get_move_class(move)
      get_moves_from_string(move).first.capitalize
    end
  end

  def to_s
    self.class.to_s
  end
end
