class InvalidCodonError < StandardError
end

class Translation
  AMINO_ACIDS_MAP = { 
    ["AUG"] => 'Methionine',
    ["UUU", "UUC"] => 'Phenylalanine',
    ["UUA", "UUG"] => 'Leucine',
    ["UCU", "UCC", "UCA", "UCG"] => 'Serine',
    ["UAU", "UAC"] => 'Tyrosine',
    ["UGU", "UGC"] => 'Cysteine',
    ["UGG"] => 'Tryptophan',
    ["UAA", "UAG", "UGA"] => 'STOP'
  }

  def self.of_codon(codon)
    matching_key = AMINO_ACIDS_MAP.keys.select { |k| k.include?(codon) }
    AMINO_ACIDS_MAP[matching_key.first]
  end

  def self.of_rna(strand)
    result = []
    self.break_into_codons(strand).each do |codon|
      raise InvalidCodonError if self.of_codon(codon).nil?
      break if self.of_codon(codon) == 'STOP'
      result << self.of_codon(codon)
    end
    result
  end

  private

  def self.break_into_codons(strand)
    strand.length <= 3 ? [strand] : [strand[0, 3]] + self.break_into_codons(strand[3..-1])
  end

end

