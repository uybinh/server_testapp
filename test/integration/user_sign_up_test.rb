require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uybinh)

  end

  test "should get new url" do
    get signup_path
    assert_template "users/new"
  end

  test "invalid sign up infomation" do
    get signup_path
    post users_path, params: { user: { name: "",
                                        email: "helloS@",
                                        password: "123",
                                        password_confirmation: "123"}}

    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_not flash.empty?
  end

  test "valid sign up infomation" do
    get signup_path
    post users_path, params: { user: { name: "Binh Xuan",
                                        email: "binhxuan@gmail.com",
                                        password: "12345678",
                                        password_confirmation: "12345678"}}
    follow_redirect!
    assert_template "users/show"
  end
end
