class Trinary
  MULTIPLIER = 3

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    decimal = 0
    return decimal unless valid_trinary?
    each_digit_with_power do |digit, power|
      decimal += digit * (MULTIPLIER ** power)
    end
    decimal
  end

  private

  def each_digit_with_power
    power = 0
    @trinary.chars.reverse.each do |digit|
      yield(digit.to_i, power)
      power += 1
    end
  end

  def valid_trinary?
    @trinary.chars.all? { |i| !(i.match(/[0-2]/).nil?) }
  end
end
