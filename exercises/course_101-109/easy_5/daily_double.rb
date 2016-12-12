def crunch(words)
  lastChar = nil
  charGroups = [];

  words.chars.each do |char|
    if lastChar == char
      charGroups.last << char
    else
      lastChar = char
      charGroups << [char]
    end
  end

  charGroups.map(&:uniq).flatten.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
