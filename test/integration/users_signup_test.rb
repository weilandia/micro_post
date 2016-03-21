require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup info" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                             email: "user@invalid",
                             password: "password",
                             password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: { name: "Nick Weiland",
                             email: "user@valid.com",
                             password: "password",
                             password_confirmation: "password" }
    end
  end
end
