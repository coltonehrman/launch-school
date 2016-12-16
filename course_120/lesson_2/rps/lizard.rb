class Lizard < Move
  def >(other_move)
    other_move.class == Paper ||
      other_move.class == Spock
  end
end
