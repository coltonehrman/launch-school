require 'date'

def friday_13th?(year)
  date = Date.new(year)
  friday_13ths = 0
  date.upto(Date.new(year + 1)) do |date|
    friday_13ths += 1 if date.day == 13 && date.friday?
  end
  friday_13ths
end

p friday_13th?(2015) == 3
p friday_13th?(1986) == 1
p friday_13th?(2019) == 2
