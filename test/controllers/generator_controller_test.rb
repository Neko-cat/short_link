require 'test_helper'

class GeneratorControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should redirect" do
    get "/generator/index"
    assert_response :redirect
  end

  test "should user login" do
    post "/login", params: {
      username: @user.username,
      password: @user.password_digest,
    }
    assert true
  end
end
