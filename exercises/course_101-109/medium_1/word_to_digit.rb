DIGITS = %w(one two three four five six seven eight nine).zip([1,2,3,4,5,6,7,8,9]).to_h

def word_to_digit(string)
  DIGITS.each { |word, digit| string.gsub!(word, digit.to_s) }
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
