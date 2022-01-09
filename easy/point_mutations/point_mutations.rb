class DNA
  attr_reader :sequence

  def initialize(str)
    @sequence = str
  end

  def hamming_distance(other_str)
    distance = 0
    short, long = [sequence, other_str].sort_by(&:size)
    (0...short.size).each do |i|
      distance += 1 if short[i] != long[i]
    end
    distance
  end

end