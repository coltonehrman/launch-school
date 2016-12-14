def substrings_at_start(string)
  substrings = string.chars.inject([[]]) { |subs, char| subs << (subs[-1] + [char]) }
  substrings.shift
  substrings.map do |chars|
    chars.reduce { |sub, char| sub + char }
  end
end

def substrings(string)
  subs = []
  while string.length > 0
    subs << substrings_at_start(string)
    string.slice!(0)
  end
  subs.flatten
end

def palindrome?(str)
  str.reverse == str
end

def palindromes(string)
  subs = substrings(string)
  subs.select { |sub| sub.length > 1 }.keep_if { |sub| palindrome?(sub) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
