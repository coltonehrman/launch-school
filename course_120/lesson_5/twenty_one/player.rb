class Player < Participant
  def set_name
    name = ''
    loop do
      print "What's your name? "
      name = gets.chomp.strip
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def stay?
    puts "Would you like to (h)it or (s)tay?"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry, must enter 'h' or 's'."
    end
    answer == 's'
  end

  def show_flop
    show_hand
  end
end
