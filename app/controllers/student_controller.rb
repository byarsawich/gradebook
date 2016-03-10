class StudentController < ApplicationController
  before_action :authenticate
  def index
    if session[:role_name] == "Student"
      student_id = Student.find_by(user_id: session[:user_id])
    else
      student_id = Parent.find_by(user_id: session[:user_id]).student_id
    end
    @students_grades = Grade.where(student_id: student_id)
    @student = Student.find(student_id)
  end
end
