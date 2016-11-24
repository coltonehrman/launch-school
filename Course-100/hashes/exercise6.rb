# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but in a different order.
# Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def sort(string)
  string.split("").sort.join("")
end

def get_matches(word_to_match, words)
  words.select { |word| sort(word) == sort(word_to_match) }
end

def get_anagrams(words)
  words.map { |word| get_matches(word, words) }.uniq
end

p get_anagrams(words)

# def get_anagrams(words)
#
#   def matches(word_to_match, words)
#     words.select { |word| word.sort.eql?( word_to_match.sort ) }
#   end
#
#   anagrams_list = words.map do |word|
#     anagrams = matches(word, words)
#     words.keep_if { |word| !anagrams.include?(word) }
#     anagrams # Why doesn't it work with return
#   end
#
#   anagrams_list.keep_if { |item| item.length != 0 }
#
# end
