class Card
  INDEX = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
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

  def index_value
    INDEX.index(rank)
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

class PokerHand
  def initialize(cards)
    @cards = []
    if cards.is_a?(Deck)
      5.times { @cards << deck.draw }
    else
      @cards = cards.take(5)
    end
    @cards.sort_by!(&:index_value)
  end

  def print
    puts @cards.map(&:to_s)
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    (@cards.all? { |card| card.suit == 'Hearts' } &&
      @cards.map(&:rank) - [10, 'Jack', 'Queen', 'King', 'Ace'] == [])
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    pairs.any? { |pair| pair[:count] == 4 }
  end

  def full_house?
    (pairs.any? { |pair| pair[:count] == 2 } &&
      pairs.any? { |pair| pair[:count] == 3 })
  end

  def flush?
    @cards.map(&:suit).uniq.count == 1
  end

  def straight?
    @cards[1..-1].each_with_index do |card, index|
      return false unless card.index_value == @cards[index].index_value + 1
    end
    true
  end

  def three_of_a_kind?
    pairs.any? { |pair| pair[:count] == 3 }
  end

  def two_pair?
    pairs.select { |pair| pair[:count] == 2 }.count == 2
  end

  def pair?
    pairs.any? { |pair| pair[:count] == 2 }
  end

  def pairs
    uniq_cards = @cards.uniq { |card| card.rank }
    uniq_cards.map do |card|
      count = @cards.count { |c| c.rank == card.rank }
      { rank: card.rank, count: count }
    end
  end
end

class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
