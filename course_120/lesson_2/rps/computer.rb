class Computer < Player
  def choose(other_moves)
    @move = Move.new_move(Move::MOVES.sample)
    super() # Error without parens
  end

  def set_name
    @name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end
