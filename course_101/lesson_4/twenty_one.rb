def initialize_deck()
  suits = [:hearts, :diamonds, :clubs, :spades]
  values = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  values.product(suits).map do |card|
    { value: card[0], suit: card[1] }
  end
end

def deal_cards!(deck)
  hand_one = []
  hand_two = []
  2.times { hand_one << deck.shift }
  2.times { hand_two << deck.shift }
  { dealer: hand_one, player: hand_two }
end

def card_value(card)
  value = card[:value]
  value = value.to_s.capitalize if value.is_a?(Symbol)
  value
end

def cards_values(cards)
  cards.map.with_index do |card, index|
    "#{card_value(card)}"
  end.join(', ')
end

def show_cards(cards)
  puts "Dealer has: #{card_value(cards[:dealer].first)} and unknown card"
  puts "You have: #{cards_values(cards[:player])}"
end

deck = initialize_deck.shuffle
cards = deal_cards!(deck)

p cards_values(cards[:player]).sub(/,/, ' and')
