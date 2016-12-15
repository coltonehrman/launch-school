require 'pry'

class Move
  VALUES = ['Rock', 'Paper', 'Scissors'].freeze
  attr_reader :value

  def self.values
    values = VALUES.map(&:downcase).join(', ')
    values.reverse.sub(',', ' or'.reverse).reverse
  end

  def initialize(value)
    @value = value.capitalize
  end

  def >(other_move)
    (rock? && other_move.scissors?)   ||
      (paper? && other_move.rock?)    ||
      (scissors? && other_move.paper?)
  end

  def rock?
    value == 'Rock'
  end

  def paper?
    value == 'Paper'
  end

  def scissors?
    value == 'Scissors'
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :name
  attr_reader :move

  def initialize
    set_name
  end
end

class Human < Player
  def choose
    choice = nil
    loop do
      print "Please choose #{Move.values}: "
      choice = gets.chomp
      break if Move::VALUES.map(&:downcase).include?(choice)
      puts "Sorry, invalid choice."
    end
    @move = Move.new(choice)
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

class Computer < Player
  def choose
    @move = Move.new(Move::VALUES.sample)
  end

  def set_name
    @name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again (y/n)? "
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES.join(', ')}!"
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALUES.join(', ')}. Goodbye #{human.name}!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
end

RPSGame.new.play
