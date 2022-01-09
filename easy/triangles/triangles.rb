class Triangle

  def initialize(s1, s2, s3)
    @side1, @side2, @side3 = s1, s2, s3
    @sides = [@side1, @side2, @side3]

    # raise argument error if any of the sides are zero OR 
    # if the sum of any two sides is strictly less than the other side
    if @sides.any?(&:zero?) || !sums_of_sides_valid?
      raise ArgumentError
    end
  end

  def kind
    # returns string of what kind of triangle the instance of Triangle is
    case
    when equilateral? then 'equilateral'
    when isosceles? then 'isosceles'
    when scalene? then 'scalene'
    end
  end

  private

    # that sides should be positive accounted for in Arg Error on initialization
    def equilateral?
      @sides.uniq.size == 1
    end

    def isosceles?
      @sides.uniq.size == 2
    end

    def scalene?
      !equilateral? && !isosceles?
    end

    def sums_of_sides_valid?
      @sides.each_with_index do |s, i|
        temp_sides = @sides.dup
        temp_sides.delete_at(i)
        other_sides = temp_sides 
        return false unless other_sides.sum > s
      end
      true 
    end

end