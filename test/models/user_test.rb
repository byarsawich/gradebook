require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "get role information" do
    r = Role.create(name: "Teacher", role: 1)
    u = User.create(email: 'a@a.com', password: "monkey")
    r.users << u
    assert_equal "Teacher", u.role_name
    assert_equal 1, u.get_role
  end

  test "get root path" do
    r = Role.create(name: "Teacher", role: 1)
    r2 = Role.create(name: "Student", role: 2)
    u = User.create(email: "a@a.com", password: "monkey")
    u2 = User.create(email: "b@b.com", password: "spaceballs")
    r.users << u
    r2.users << u2

    assert_equal Rails.application.routes.url_helpers.teacher_index_path, u.get_home_dashboard
    assert_equal Rails.application.routes.url_helpers.student_index_path, u2.get_home_dashboard
  end
end
