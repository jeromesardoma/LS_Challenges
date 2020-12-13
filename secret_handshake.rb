class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(decimal)
    @decimal = decimal
  end

  def commands
    result = []
    return result unless valid?
    binary_digits = case @decimal
                    when Integer then @decimal.to_s(2).to_i.digits
                    when String then @decimal.to_i.digits
                    end
    digits_to_iterate = binary_digits.size == 5 ? binary_digits[0...-1] : binary_digits
    digits_to_iterate.each_with_index do |digit, index|
      result << ACTIONS[index] if digit == 1
    end
    return result unless binary_digits.last == 1 && binary_digits.size == 5
    result.reverse
  end
  
  def valid?
    @decimal.is_a?(Integer) || 
      ( @decimal.is_a?(String) && 
        @decimal.chars.all? { |c| ("0".."1").include?(c) } )
  end

end
