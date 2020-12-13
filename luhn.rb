class Luhn
  def initialize(n)
    @number = n
  end

  def self.create(int)
    temp_digits = [nil] + int.digits
    temp_addends = self.double_every_other(temp_digits)
    temp_sum = temp_addends[1..-1].sum
    nearest_ten = temp_sum % 10 == 0 ? temp_sum : (temp_sum / 10 + 1) * 10
    digit_to_replace = nearest_ten - temp_sum
    temp_digits[0] = digit_to_replace
    temp_digits.reverse.map(&:to_s).join.to_i
  end

  def addends
    double_every_other(@number.digits).reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  private

  def self.double_every_other(arr)
    arr.map.with_index do |digit, index|
      if index.odd?
        double = digit * 2
        double > 10 ? double -= 9 : double
      else
        digit
      end
    end
  end

  def double_every_other(arr)
    self.class.double_every_other(arr)
  end

end