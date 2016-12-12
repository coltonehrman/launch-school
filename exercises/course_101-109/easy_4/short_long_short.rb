def short_long_short(str1, str2)
  if str1.length > str2.length
    short = str2
    long = str1
  else
    short = str1
    long = str2
  end
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
