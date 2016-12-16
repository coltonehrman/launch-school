class Player
  attr_accessor :name
  attr_reader :moves, :move, :score

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

  def percent_won(move)
    (won_moves.count(move) * 100).to_f / @moves.count.to_f
  end

  def percent_lost(move)
    (lost_moves.count(move) * 100).to_f / @moves.count.to_f
  end

  def lost_moves
    @moves.select { |move| move[:result] == :lost }.map { |hsh| hsh[:move] }
  end

  def won_moves
    @moves.select { |move| move[:result] == :won }.map { |hsh| hsh[:move] }
  end

  def to_s
    @name
  end
end
