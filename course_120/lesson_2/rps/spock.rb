class Spock < Move
  def >(other_move)
    other_move.class == Scissors ||
      other_move.class == Rock
  end
end
