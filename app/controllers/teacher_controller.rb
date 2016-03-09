class TeacherController < ApplicationController
  before_action :authenticate
  before_action :authorize_dashboard

  def index
    @users_teachers = User.with_group(:teacher)
    @users_students = User.with_group(:student)
    @users_parents = User.with_group(:parent)
    @assignments = Assignment.all
  end

  private def authorize_dashboard
    edirect_to student_index_path, notice: "You don't have permission to access that page." unless session[:role_name] == "Teacher"
  end
end
