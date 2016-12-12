def letter_case_count(string)
  string.chars.inject({lowercase: 0, uppercase: 0, neither: 0}) do |hsh, char|
    if char =~ /[^a-zA-Z]/
      hsh[:neither] += 1
    else
      hsh[:lowercase] += 1 if char.downcase == char
      hsh[:uppercase] += 1 if char.upcase == char
    end
    hsh
  end
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
