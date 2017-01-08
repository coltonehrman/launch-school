class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  class << self
    def to(max)
      self.new.to(max)
    end
  end

  def initialize(*args)
    args = DEFAULT_MULTIPLES if args.empty?
    @multiples = args
  end

  def to(max)
    multiples(max).reduce(0, &:+)
  end

  private

  def multiples(max)
    (1...max).select do |num|
      @multiples.any? { |mult| num % mult == 0 }
    end
  end
end
