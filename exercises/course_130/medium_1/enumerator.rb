factorials = Enumerator.new do |arr|
  num = 0
  loop do
    arr << (num.downto(1).reduce(&:*) || 1)
    num += 1
  end
end

p factorials.take(7)
