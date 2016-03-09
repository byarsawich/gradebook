class TeacherController < ApplicationController
  before_action :authenticate
  before_action :authorize_teacher
  
  def index
    @users_teachers = User.with_group(:teacher)
    @users_students = User.with_group(:student)
    @users_parents = User.with_group(:parent)
    @assignments = Assignment.all
  end
end
