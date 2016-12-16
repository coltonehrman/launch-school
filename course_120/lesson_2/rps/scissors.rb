class Scissors < Move
  def >(other_move)
    other_move.class == Paper ||
      other_move.class == Lizard
  end
end
