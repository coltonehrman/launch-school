class Rock < Move
  def >(other_move)
    other_move.class == Lizard ||
      other_move.class == Scissors
  end
end

class Paper < Move
  def >(other_move)
    other_move.class == Rock ||
      other_move.class == Spock
  end
end

class Scissors < Move
  def >(other_move)
    other_move.class == Paper ||
      other_move.class == Lizard
  end
end

class Lizard < Move
  def >(other_move)
    other_move.class == Paper ||
      other_move.class == Spock
  end
end

class Spock < Move
  def >(other_move)
    other_move.class == Scissors ||
      other_move.class == Rock
  end
end
