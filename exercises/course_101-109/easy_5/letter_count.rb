def word_sizes(words)
  words.split.inject(Hash.new(0)) do |hsh, word|
    hsh[word.length] = hsh[word.length] + 1
    hsh
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

def word_sizes(words)
  words.gsub(/[^a-zA-Z0-9_\s]/, '').split.inject(Hash.new(0)) do |hsh, word|
    hsh[word.length] = hsh[word.length] + 1
    hsh
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
