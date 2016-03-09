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

  def self.create_teacher(email: nil, password: nil, first_name: nil, last_name: nil)
    t = Teacher.create(first_name: first_name, last_name: last_name)
    u = User.create(email: email, password: password, role_id: Role.find_by(name: "Teacher").id )
    u.teacher = t
    t.save
    u.save
    u
  end

  def self.create_student(email: nil, password: nil, first_name: nil, last_name: nil, teacher_id: nil, parent_id: nil)
    s = Student.create(first_name: first_name, last_name: last_name, teacher_id: teacher_id, parent_id: parent_id)
    u = User.create(email: email, password: password, role_id: Role.find_by(name: "Student").id )
    u.student = s
    s.save
    u.save
    u
  end

  def self.create_parent(email: nil, password: nil, first_name: nil, last_name: nil)
    p = Parent.create(first_name: first_name, last_name: last_name)
    u = User.create(email: email, password: password, role_id: Role.find_by(name: "Parent").id )
    u.parent = p
    p.save
    u.save
    u
  end


  def self.with_group(group)
    joins(group)
  end
end
