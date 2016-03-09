require 'test_helper'

class AuthenticateControllerTest < ActionController::TestCase
  test "should get login" do
    get :new
    assert_response :success
  end

  test "should get logout" do
    get :delete
    assert_redirected_to login_path
  end

end
