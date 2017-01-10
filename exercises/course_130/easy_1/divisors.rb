def divisors(num)
  return [1] if num == 1
  1.upto(num / 2).select do |div|
    (num % div).zero?
  end << num
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
