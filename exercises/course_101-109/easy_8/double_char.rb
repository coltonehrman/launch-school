def repeater(string)
  string.chars.map { |c| c * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

def consonant_arr
  ('a'..'z').to_a - %w(a e i o u)
end


def double_consonants(string)
  cons = consonant_arr
  string.chars.map do |c|
    consonant_arr.include?(c.downcase) ? c * 2 : c
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
