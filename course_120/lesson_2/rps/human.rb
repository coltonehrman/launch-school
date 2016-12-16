class Human < Player
  def choose
    choice = nil
    loop do
      print "Please choose #{Move.show_moves}: "
      choice = gets.chomp
      break if Move.valid_move(choice)
      puts "Sorry, invalid choice."
    end
    @move = Move.new_move(choice)
    super
  end

  def set_name
    name = ""
    loop do
      print "What's your name? "
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter something."
    end
    @name = name
  end
end
