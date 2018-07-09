require 'test_helper'

class LogoutUserTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uybinh)
  end

  test "should have logout button" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { email: "binh@gmail.com", password: "password"}}
    delete logout_path
  end
end
