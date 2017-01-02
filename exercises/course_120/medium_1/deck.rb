class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other)
    (value == other.value) &&
      (suit == other.suit)
  end

  def <=>(other)
    value <=> other.value
  end

  def value
    return rank unless rank.is_a?(String)
    rank == 'Ace' ? 11 : 10
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset_deck
  end

  def draw
    card = @cards.pop
    reset_deck if @cards.empty?
    card
  end

  private

  def reset_deck
    cards = RANKS.product(SUITS)
    1000.times { cards.shuffle! }
    @cards = cards.map do |card|
      Card.new(card.first, card.last)
    end
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
