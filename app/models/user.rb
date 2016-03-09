class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_secure_password
  belongs_to :role
  has_one :teacher
  has_one :student
  has_one :parent

  def role_name
    role && role.name
  end

  def get_role
    role && role.role
  end

  def get_home_dashboard
    role.role == 1 ? Rails.application.routes.url_helpers.teacher_index_path : Rails.application.routes.url_helpers.student_index_path
  end

  def self.create_user(email: nil, password: nil, type: nil, user_params: nil)
    userclass = type.constantize
    userclass.connection
    newuser = userclass.create(user_params)
    u = User.create(email: email, password: password, role_id: Role.find_by(name: type).id)
    newuser.user = u
    newuser.save
    u.save
    u
  end

  def self.with_group(group)
    joins(group)
  end
end
