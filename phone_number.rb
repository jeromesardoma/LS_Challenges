class PhoneNumber
  INVALID_VALUE = '0000000000'

  def initialize(str)
    @digits = parse_digits(str)
  end

  def area_code
    number[0, 3]
  end

  def number
    case @digits.length
    when 10 then @digits
    when 11
      @digits.start_with?("1") ? @digits[1..-1] : INVALID_VALUE
    else INVALID_VALUE
    end
  end

  def to_s
    "(#{number[0, 3]}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private

  def parse_digits(str)
    result = ""
    str.each_char do |c|
      return INVALID_VALUE if c.between?("a", "z")
      result << c if c.between?("0", "9")
    end
    result
  end

end