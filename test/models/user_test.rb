require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should not save without username and password" do
    user = User.new
    assert_not user.save
  end

  test "should user create" do
    user = User.new(username: @user.username, password: @user.password)
    user.save
    username = user.username
    assert_equal "UserOne", username, "Username not correct"
  end
end
