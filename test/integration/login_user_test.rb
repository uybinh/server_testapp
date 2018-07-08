require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uybinh)
  end

  test "get login path" do
    get login_path
    assert_template "sessions/new"
    assert_select "form[action='/login']"
  end

  test "login with invalid infomation" do
    get login_path
    post login_path, params: {session: { email: "invalid", password: "password"}}
    assert_template "sessions/new"
    post login_path, params: {session: { email: @user.email, password: "invalid"}}
    assert_template "sessions/new"
  end

  test "login with valid infomation" do
    get login_path
    post login_path, params: { session: { email: "binh@gmail.com", password: "password"}}
    assert is_logged_in?
    assert_redirected_to @user
  end
end
