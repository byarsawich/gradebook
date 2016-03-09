class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_secure_password
  belongs_to :role
  has_one :teacher, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :parent, dependent: :destroy

  def role_name
    role && role.name
  end

  def get_role
    role && role.role
  end

  def get_home_dashboard
    role.role == 1 ? Rails.application.routes.url_helpers.teacher_index_path : Rails.application.routes.url_helpers.student_index_path
  end

  def self.create_user(email: nil, password: nil, type: nil, user_hash: nil)
    userclass = type.constantize
    userclass.connection
    newuser = userclass.create(user_hash)
    u = User.create(email: email, password: password, role_id: Role.find_by(name: type).id)
    newuser.user = u
    newuser.save
    u.save
    u
  end

  def update_user?(email: nil, user_hash: nil)
    if teacher
      success = teacher.update(user_hash)
    elsif student
      success = student.update(user_hash)
    elsif parent
      success = parent.update(user_hash)
    end
    update(email: email) if success
  end

  def self.with_group(group: nil, clause: nil)
    joins(group).where(clause)
  end
end
