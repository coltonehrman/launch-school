class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError if num > @string.length
    digits = get_digits
    num_slices = @string.length - (num - 1)
    slices = []
    num_slices.times do
      slices << digits.take(num)
      digits.shift
    end
    slices
  end

  private

  def get_digits
    @string.chars.map(&:to_i)
  end
end
