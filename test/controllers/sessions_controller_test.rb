require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get login" do
    get "/login"
    assert_response :success
  end

  test "should get welcome" do
    get "/welcome"
    assert_response :success
  end

  test "should connect" do
    sign_in @user
    get "/welcome"
    assert_select "h2", text: "Déjà connecté: " + @user.username
  end
end
