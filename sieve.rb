class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    sieve = (2..@limit).to_a
    primes = []
    loop do
      break if sieve[1..-1].nil? # trying to access an index not within the 
      # array's index range will return nil
      ints_to_delete = sieve[1..-1].select { |n| n % sieve[0] == 0 }
      sieve -= ints_to_delete
      primes << sieve[0]
      sieve = sieve[1..-1]
    end
    primes
  end

end

