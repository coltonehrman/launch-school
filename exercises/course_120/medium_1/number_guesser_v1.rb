class PingGame
  START = 1
  LIMIT = 100

  def initialize
    @secret = (START..LIMIT).to_a.sample
    @guesses_left = 7
  end

  def play
    until @guesses_left.zero?
      puts "You have #{@guesses_left} guesses remaining."
      guess = get_guess
      p guess
      @guesses_left -= 1
    end
  end

  private

  def get_guess
    loop do
      print "Enter a number in between #{START} and #{LIMIT}: "
      guess = gets.chomp.strip.to_i
      unless valid_guess?(guess)
        print "Invalid Guess. "
        next
      end
      break guess
    end
  end

  def valid_guess?(guess)
    (START..LIMIT).include?(guess)
  end
end

PingGame.new.play
