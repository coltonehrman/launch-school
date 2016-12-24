class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def player_turn
    puts "#{player}'s turn..."
    loop do
      if player.stay?
        puts "#{player} stays!"
        break
      end
      player.add_card(deck.deal_one)
      puts "#{player} hits!"
      player.show_hand
      break if player.busted?
    end
  end

  def dealer_turn
    puts "#{dealer}'s turn..."
    loop do
      if dealer.total >= 17
        puts "#{dealer} stays!"
        break
      end
      puts "#{dealer} hits!"
      dealer.add_card(deck.deal_one)
      break if dealer.busted?
    end
  end

  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "It looks like #{player.name} wins!"
    elsif player.total < dealer.total
      puts "It looks like #{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def start
    loop do
      system 'clear'
      deal_cards
      show_flop

      player_turn
      show_busted if player.busted?
      dealer_turn
      show_busted if dealer.busted?

      # both stayed
      show_cards
      show_result
      play_again? ? reset : break
    end
    puts "Thank you for playing Twenty-One. Goodbye!"
  end
end
