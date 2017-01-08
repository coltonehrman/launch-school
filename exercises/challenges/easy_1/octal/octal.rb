class Octal
  MULTIPLIER = 8

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    decimal = 0
    return decimal unless valid_octal?
    each_digit_with_power do |digit, power|
      decimal += digit * (MULTIPLIER ** power)
    end
    decimal
  end

  private

  def each_digit_with_power
    power = 0
    @octal.chars.reverse.each do |digit|
      yield(digit.to_i, power)
      power += 1
    end
  end

  def valid_octal?
    valid_int? && @octal.chars.all? { |i| i.to_i < 8 }
  end

  def valid_int?
    !(@octal =~ /^\d+$/).nil?
  end
end
