class TeacherController < ApplicationController
  def index
    @users_teachers = User.with_teachers
    @users_students = User.with_students
    @user_parents = User.with_parents
  end
end
