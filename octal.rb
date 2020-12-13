class Octal
  def initialize(str)
    @str_as_octal = str    
  end

  def to_decimal
    return 0 if self.invalid?
    @str_as_octal.to_i.digits.map.with_index do |int, ind|
      int * (8 ** ind)
    end.sum
  end

  private

  def invalid? 
    @str_as_octal.each_char do |char|
      return true unless ("0".."7").include?(char)
    end
    false
  end

end
