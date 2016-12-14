def substrings_at_start(string)
  substrings = string.chars.inject([[]]) { |subs, char| subs << (subs[-1] + [char]) }
  substrings.shift
  substrings.map do |chars|
    chars.reduce { |sub, char| sub + char }
  end
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def substrings(string)
  subs = []
  while string.length > 0
    subs << substrings_at_start(string)
    string.slice!(0)
  end
  subs.flatten
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
