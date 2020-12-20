class School
  def initialize
    @students = {}
  end

  def add(name, grade)
    @students[name] = grade
  end

  def grade(desired_grade)
    existing_grades = @students.values.uniq
    return [] unless existing_grades.include? desired_grade
    to_h[desired_grade] 
  end

  def to_h
    names = @students.keys
    names.group_by { |n| @students[n] }
      .each { |_, names| names.sort! }
      .sort_by { |grade, _| grade }
      .to_h
  end

end