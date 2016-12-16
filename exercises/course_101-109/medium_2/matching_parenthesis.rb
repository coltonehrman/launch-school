def balanced?(string)
  return false if string.count('(') != string.count(')')
  open_parens = 0
  string.chars.each do |char|
    open_parens += 1 if char == '('
    open_parens -= 1 if char == ')'
    return false if open_parens < 0
  end
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
