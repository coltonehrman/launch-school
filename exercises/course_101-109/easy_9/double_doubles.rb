def is_double?(num)
  length = num.to_s.length
  return false if length.odd?
  middle = length / 2
  left_side = num.to_s[0...middle].to_i
  right_side = num.to_s[middle..-1].to_i
  left_side == right_side
end

def twice(num)
  is_double?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
