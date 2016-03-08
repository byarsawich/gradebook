class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_secure_password
  belongs_to :role

  def role_name
    role && role.name
  end

  def get_role
    role && role.role
  end

  def get_home_dashboard
    role.role == 1 ? Rails.application.routes.url_helpers.teacher_index_path : Rails.application.routes.url_helpers.student_index_path
  end
end
