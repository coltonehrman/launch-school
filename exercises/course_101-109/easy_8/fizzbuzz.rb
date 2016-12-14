def fizzbuzz(first, last)
  (first..last).to_a.map do |num|
    if num % 5 == 0 && num % 3 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end
end

p fizzbuzz(1, 15)# == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
