def balancer?(string)
  return false unless string.count('(') == string.count(')')
  open_parens = 0
  !!string.chars.each do |char|
    open_parens += 1 if char == '('
    open_parens -= 1 if char == ')'
    return false if open_parens < 0
  end
end


p balancer?('hi') == true
p balancer?('(hi') == false
p balancer?('(hi)') == true
p balancer?('(())hi)(') == false
