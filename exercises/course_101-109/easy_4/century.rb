# Figure out the century name for the number - EX. 1901 == 20th
#   - Notes:
#     -  new centuries begin in years that end with 01
#   - subtract the input by 1
#   - get the digits after the hundreth position
#   - add 1 to the digits
#   - append the appropriate ending to the number
#     - if num has a 1-3 at the end it is either st, nd, or rd
#       - except for 11,12,13
#     - everything else is th
# - 1 = st
# - 2 = nd
# - 3 = rd
# - 4-20 = th
# - 21 = st
# - 22 = nd
# - 23 = rd
# - 24-30 = th
# ...


def century(num)
  century_num = (num - 1).divmod(100)[0] + 1
  last_digit = century_num.to_s[-1].to_i
  century_num.to_s + if (11..13).include?(century_num.to_s[-2..-1].to_i)
    'th'
  elsif (1..3).include?(last_digit)
    if last_digit == 1
      'st'
    elsif last_digit == 2
      'nd'
    else
      'rd'
    end
  else
    'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
