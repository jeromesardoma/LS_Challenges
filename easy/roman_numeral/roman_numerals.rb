class RomanNumeral
  attr_reader :number

  def initialize(int)
    @number = int
  end

  def to_roman
    digits = number.digits.reverse

    # add additional zeroes to digits array, as iteration below depends on
    # iterating through a 4-item array to get numerals
    (4 - digits.size).times { digits.unshift(0) }

    numerals = ''
    digits.each_with_index do |d, i|
      numerals << case i
                  when 0 then 'M' * d
                  when 1 then numerals_for_chars(d, 'C', 'D', 'M')
                  when 2 then numerals_for_chars(d, 'X', 'L', 'C')
                  else numerals_for_chars(d, 'I', 'V', 'X')
                  end
    end
    numerals
  end

  private
  
    def numerals_for_chars(int, one_char, five_char, ten_char)
      if int == 9              then one_char + ten_char
      elsif int > 5 && int < 9 then five_char + one_char * (int - 5)
      elsif int == 5           then five_char
      elsif int == 4           then one_char + five_char
      elsif int > 0 && int < 4 then one_char * int
      else ''
      end
    end

end