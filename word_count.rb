class Phrase
  def initialize(word_string)
    @word_string = word_string
  end

  def word_count
    parsed_words.tally
  end

  private

  def parsed_words
    regex = /\d{1}|\w+'?\w+/
    @word_string.downcase.scan(regex)
  end

end