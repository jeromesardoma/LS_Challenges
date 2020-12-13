class Trinary
  def initialize(str)
    @str_as_tri = str
  end

  def to_decimal
    @str_as_tri.to_i.digits.map.with_index do |int, ind|
      int * (3 ** ind)
    end.sum
  end

  private

  def invalid?
    @str_as_tri.each_char do |char|
      return true unless ("0".."2").include?(char)
    end
    false
  end

end