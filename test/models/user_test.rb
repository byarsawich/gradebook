require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @r1 = roles(:one)
    @r2 = roles(:two)
  end
  test "get role information" do
    u = User.create(email: 'a@a.com', password: "monkey")
    @r1.users << u
    assert_equal "Teacher", u.role_name
    assert_equal 1, u.get_role
  end

  test "get root path" do
    u = User.create(email: "a@a.com", password: "monkey")
    u2 = User.create(email: "b@b.com", password: "spaceballs")
    @r1.users << u
    @r2.users << u2

    assert_equal Rails.application.routes.url_helpers.teacher_index_path, u.get_home_dashboard
    assert_equal Rails.application.routes.url_helpers.student_index_path, u2.get_home_dashboard
  end

  test "user create new user" do
    u = User.create_user(email: "a@a.com", password: "monkey", type: "Teacher", user_hash: { first_name: "Alex", last_name: "Anzio"})
    t = Teacher.find_by(user_id: u.id)
    assert_equal 1, u.get_role
    assert_equal "Alex", u.teacher.first_name
    assert_equal "a@a.com", t.user.email
  end
end
