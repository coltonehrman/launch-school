class Player
  attr_reader :moves, :move, :score

  class << self
    def record_hisory(winner, loser)
      winner.won
      loser.lost
    end
  end

  def initialize
    @score = 0
    @moves = []
    set_name
  end

  def choose
    @moves << { move: @move.class, result: nil }
  end

  def won
    @score += 1
    @moves.last[:result] = :won
    puts "#{self} won this round!"
  end

  def lost
    @moves.last[:result] = :lost
  end

  def percent(moves, move)
    (moves.count(move) * 100).to_f / @moves.count.to_f
  end

  def get_moves(result)
    @moves.select { |move| move[:result] == result }.map { |hsh| hsh[:move] }
  end

  def to_s
    @name
  end
end
