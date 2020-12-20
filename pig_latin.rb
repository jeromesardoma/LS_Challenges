class PigLatin

  def self.translate(str)
    str.split.map do |word|
      vowel_regex = /^[aeiou]|^yt|^xr/
      consonant_regex = /^squ|^qu|^[b-df-hj-n-pr-tv-z]+/
      if word.scan(vowel_regex).size == 1
        word + "ay"
      elsif word.scan(consonant_regex).size == 1
        first_syllable = word.scan(consonant_regex).first
        word[first_syllable.length..-1] + first_syllable + 'ay'
      else
        raise StandardError, "Invalid word input"
      end
    end.join " "
  end

end