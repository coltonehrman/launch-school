def swapcase(string)
  string.chars.map do |char|
    if char.downcase == char
      char.upcase
    else
      char.downcase
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
