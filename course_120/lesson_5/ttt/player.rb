class Player
  attr_accessor :marker, :name
  attr_reader :score

  def initialize
    @score = 0
  end

  def won
    @score += 1
  end

  def to_s
    name
  end
end
