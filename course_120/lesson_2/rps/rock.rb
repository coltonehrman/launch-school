class Rock < Move
  def >(other_move)
    other_move.class == Lizard ||
      other_move.class == Scissors
  end
end
