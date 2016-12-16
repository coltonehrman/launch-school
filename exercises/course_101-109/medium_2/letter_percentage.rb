def letter_percentages(string)
  percent = (100.0 / string.chars.count)
  string.chars.inject({lowercase: 0, uppercase: 0, neither: 0}) do |hsh, char|
    if char =~ /[^a-zA-Z]/
      hsh[:neither] += percent
    else
      hsh[:lowercase] += percent if char.downcase == char
      hsh[:uppercase] += percent if char.upcase == char
    end
    hsh
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
