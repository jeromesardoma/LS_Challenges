class Anagram
  def initialize(word)
    @base_word = word
  end

  def match(test_words_arr)
    test_words_arr.select do |word|
      word_lengths_match?(word) && 
        counts_match?(word) && 
        word.downcase != @base_word
    end
  end

  def word_lengths_match?(test_word)
    @base_word.length == test_word.length
  end

  def counts_match?(test_word)
    char_count(@base_word) == char_count(test_word)
  end

  private

  def char_count(str)
    str.downcase.chars.tally.sort_by { |k, v| k }.to_a
  end

end