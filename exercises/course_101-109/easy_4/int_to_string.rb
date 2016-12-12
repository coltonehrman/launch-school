CHAR_MAP = ('0'..'9').to_a

def integer_to_string(int)
  str = ''
  begin
    int, digit = int.divmod(10)
    str.prepend(CHAR_MAP[digit])
  end while int > 0
  str
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

def signed_integer_to_string(num)
  str = integer_to_string(num)
  return str if num.zero?
  num < 0 ? str.prepend('-') : str.prepend('+')
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
