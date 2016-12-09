INT_MAP = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  num = 0
  str.reverse.chars.each_with_index do |c, i|
    num += i > 0 ? (INT_MAP[c] * (10 ** i)) : INT_MAP[c]
  end
  num
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

def string_to_signed_integer(str)
  is_negative = str.gsub!(/-/, '') ? true : false
  str.gsub!(/\+/, '')
  num = string_to_integer(str)
  is_negative ? -num : num
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
