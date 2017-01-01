class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = (2..@limit).to_a
    primes = [numbers.first]
    multiple = primes.last
    until primes.last.nil?
      numbers.reject! { |n| n % multiple == 0 }
      primes << numbers.first
      multiple = primes.last
    end
    primes.compact
  end
end
