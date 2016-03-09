class StudentController < ApplicationController
  before_action :authenticate
  def index
    @students_grades = Grade.where(student_id: session[:user_id])
  end
end
