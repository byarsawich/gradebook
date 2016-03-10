class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment

  def student_name
    student.name
  end

  def assignment_name
    assignment.name
  end
end
