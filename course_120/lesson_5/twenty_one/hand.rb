module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end

  def total
    total = 0
    cards.each do |card|
      total += if card.ace?
                 11
               elsif card.jack? || card.queen? || card.king?
                 10
               else
                 card.face
               end
    end

    # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end
