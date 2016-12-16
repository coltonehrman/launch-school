class Paper < Move
  def >(other_move)
    other_move.class == Rock ||
      other_move.class == Spock
  end
end
