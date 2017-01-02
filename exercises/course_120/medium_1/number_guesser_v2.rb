class Guesser
  def initialize(start, limit)
    @range = (start..limit)
    @guesses_left = Math.log2(@range.size).to_i + 1
  end

  def play
    @secret = @range.to_a.sample
    until won? || @guesses_left.zero?
      puts "\nYou have #{@guesses_left} guesses remaining."
      @guess = get_guess
      display_result
      @guesses_left -= 1
    end
    puts won? ? "You win!" : "You are out of guesses. You lose."
  end

  private

  def get_guess
    loop do
      print "Enter a number in between #{@range.begin} and #{@range.end}: "
      guess = gets.chomp.strip.to_i
      unless valid_guess?(guess)
        print "Invalid Guess. "
        next
      end
      break guess
    end
  end

  def display_result
    puts "Your guess is too low" if @guess < @secret
    puts "Your guess is too high" if @guess > @secret
  end

  def won?
    @guess == @secret
  end

  def valid_guess?(guess)
    @range.include?(guess)
  end
end

Guesser.new(501, 1500).play
