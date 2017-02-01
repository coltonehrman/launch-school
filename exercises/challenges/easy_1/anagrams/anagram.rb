class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(words)
    words.select do |word|
      anagram?(word.downcase)
    end
  end

  private

  def anagram?(word)
    return false if word.length != @word.length ||
                    word == @word
    word_clone = @word.clone.downcase
    word.chars.all? do |char|
      word_clone.sub!(char, '')
    end
  end
end
