require('pry')

def clear_screen
  system('clear')
end

def initialize_deck
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

def card_name(card)
  value = card[:value]
  value = value.to_s.capitalize if value.is_a?(Symbol)
  value
end

def cards_names(cards)
  cards.map do |card|
    card_name(card).to_s
  end.join(', ').reverse.sub(',', ' and'.reverse).reverse
end

def print_cards(cards, player_turn=true)
  clear_screen
  if player_turn
    puts "Dealer has: #{card_name(cards[:dealer].first)} and unknown card"
  else
    puts "Dealer has: #{cards_names(cards[:dealer])} \
for a total of #{hand_count(cards[:dealer])}"
  end
  puts "You have: #{cards_names(cards[:player])} \
for a total of #{hand_count(cards[:player])}"
  puts "\n"
end

# def hand_count(hand)
#   aces = hand.select { |card| card[:value] == :ace }
#   hand = hand - aces
#   count = hand.reduce(0) do |sum, card|
#     value = card[:value]
#     value.is_a?(Symbol) ? sum + 10 : sum + value
#   end
#   count += aces.count
#   aces.count.times { count += 10 if (count + 10) <= 21 }
#   count
# end

def hand_count(hand)
  values = hand.map { |card| card[:value] }
  count = values.reduce(0) do |sum, value|
    if value == :ace
      sum + 11
    elsif value.is_a?(Symbol)
      sum + 10
    else
      sum + value
    end
  end
  values.select { |value| value == :ace }.count.times do
    count -= 10 if count > 21
  end
  count
end

def busted?(hand)
  hand_count(hand) > 21
end

def hit!(hand, deck)
  hand << deck.shift
end

def hit_or_stay
  loop do
    print "(H)it or (S)tay: "
    answer = gets.chomp.downcase
    return answer.chars.first if ['h', 's'].include?(answer)
    puts "Must enter 'h' or 's'"
  end
end

def player_turn!(deck, cards)
  loop do
    print_cards(cards)
    choice = hit_or_stay
    hit!(cards[:player], deck) if choice == 'h'
    break if choice == 's' || busted?(cards[:player])
  end
end

def dealer_turn!(deck, cards)
  print_cards(cards)
  unless busted?(cards[:player])
    loop do
      hit!(cards[:dealer], deck) if hand_count(cards[:dealer]) < 17
      break if hand_count(cards[:dealer]) >= 17 || busted?(cards[:dealer])
    end
  end
end

def detect_result(cards)
  player_hand = hand_count(cards[:player])
  dealer_hand = hand_count(cards[:dealer])
  if player_hand > 21
    :player_busted
  elsif dealer_hand > 21
    :dealer_busted
  elsif player_hand > dealer_hand
    :player
  elsif dealer_hand > player_hand
    :dealer
  else
    :tie
  end
end

def print_results(cards)
  results = detect_result(cards)
  print_cards(cards, false)
  player_hand = hand_count(cards[:player])
  dealer_hand = hand_count(cards[:dealer])
  case results
  when :player_busted
    puts "You busted with #{player_hand}! \
Dealer won with #{dealer_hand}!"
  when :dealer_busted
    puts "Dealer busted with #{dealer_hand}! \
You won with #{player_hand}!"
  when :player
    puts "You won with #{player_hand}! \
Dealer had #{dealer_hand}"
  when :dealer
    puts "Dealer won with #{dealer_hand}! \
You had #{player_hand}"
  when :tie
    puts "It's a tie with #{player_hand}!"
  end
  puts "\n"
end

def play_again?
  loop do
    print "Do you want to play again (Y/n)? "
    answer = gets.chomp.downcase
    next unless answer == 'y' || answer == 'n'
    return answer == 'y'
  end
end

def start
  loop do
    deck = initialize_deck.shuffle
    cards = deal_cards!(deck)
    player_turn!(deck, cards)
    dealer_turn!(deck, cards)
    print_results(cards)
    break unless play_again?
  end
end

start
