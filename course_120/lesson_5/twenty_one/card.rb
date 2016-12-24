class Card
  SUITS = [:Hearts, :Diamonds, :Spades, :Clubs].freeze
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace].freeze

  attr_reader :face, :suit

  def initialize(face, suit)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{@face} of #{@suit}"
  end

  def jack?
    @face == :Jack
  end

  def queen?
    @face == :Queen
  end

  def king?
    @face == :King
  end

  def ace?
    @face == :Ace
  end
end
