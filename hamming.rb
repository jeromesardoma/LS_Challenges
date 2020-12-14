class DNA
  def initialize(str)
    @base_dna = str
  end

  def hamming_distance(other_dna)
    count = 0
    shortest, longest = [@base_dna, other_dna].sort_by(&:length)
    shortest.chars.each_index do |i|
      count += 1 if shortest[i] != longest[i]
    end
    count
  end

end