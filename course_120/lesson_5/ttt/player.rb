class Player
  attr_accessor :marker
  attr_reader :score

  def initialize
    @score = 0
  end

  def won
    @score += 1
  end
end
