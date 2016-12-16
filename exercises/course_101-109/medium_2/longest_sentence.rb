def get_words(sentence)
  sentence.gsub(/\n/, ' ').split(/\s/).select { |word| !word.empty? }
end

open('text.txt') do |f|
  text = f.read
  sentences = text.split(/[\.\?\!]/)
  longest = sentences.reduce([]) do |longest, sentence|
    words = get_words(sentence)
    words.count > longest.count ? words : longest
  end
  puts longest.count
end
