class PerfectNumber

  def self.classify(n)
    raise StandardError unless n.positive?
    @@number = n
    case self.positive_divisors.sum <=> @@number
    when -1 then 'deficient'
    when 0  then 'perfect'
    when 1  then 'abundant'
    end
  end

  private

  def self.positive_divisors
    divisors = []
    1.upto(@@number).each do |i|
      break if divisors.include?(i)
      if @@number % i == 0
        divisors << i
        divisors << @@number / i
      end
    end
    divisors - [@@number]
  end

end

