class Series
  def initialize(str)
    @string = str
  end

  def slices(size)
    raise ArgumentError if size > @string.length
    # result = []
    # @string.chars.each_cons(size) do |sub_arr|
    #   result << sub_arr.map(&:to_i)
    # end
    # result
    @string.chars.map(&:to_i).each_cons(size).to_a
  end

end