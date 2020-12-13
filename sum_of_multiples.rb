class SumOfMultiples
  def initialize(*base_nums)
    @base_nums = base_nums
  end

  def self.to(limit, base_nums = [3,5])
    sum = 0
    (0...limit).each do |n|
      sum += n if base_nums.any? { |m| n % m == 0 }
    end
    sum
  end

  # def to(limit)
  #   sum = 0
  #   (0...limit).each do |n|
  #     sum += n if @base_nums.any? { |m| n % m == 0 }
  #   end
  #   sum
  # end

  def to(limit)
    self.class.to(limit, @base_nums)
  end
  
end
