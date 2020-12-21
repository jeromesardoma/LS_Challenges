class Integer
  SPECIALS = [4, 9, 40, 90, 400, 900].zip(%w(IV IX XL XC CD CM)).to_h
  REGULARS = [1, 5, 10, 50, 100, 500, 1000].zip(%w(I V X L C D M)).to_h
  DIVISORS = (SPECIALS.keys + REGULARS.keys).sort

  def to_roman
    result = ""
    current_value = self
    loop do
      greatest_divisor = DIVISORS.select { |d| d <= current_value }.last
      result << (SPECIALS[greatest_divisor] || REGULARS[greatest_divisor])
      current_value -= greatest_divisor
      break if current_value == 0
    end
    result
  end

end
