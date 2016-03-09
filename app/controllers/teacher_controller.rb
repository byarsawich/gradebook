class TeacherController < ApplicationController
  before_action :authenticate
  before_action :authorize_dashboard

  def index
    @users_teachers = User.with_group(group: :teacher)
    teacher_id = Teacher.find_by(user_id: session[:user_id]).id
    @users_students = User.with_group(group: :student, clause: "teacher_id = #{teacher_id}")
    @users_parents = User.with_group(group: :parent)
    @assignments = Assignment.all
  end

  private def authorize_dashboard
    redirect_to student_index_path, notice: "You don't have permission to access that page." unless session[:role_name] == "Teacher"
  end
end
