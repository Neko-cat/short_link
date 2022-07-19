require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get login" do
    get "/login"
    assert_response :success
  end

  test "should get welcome" do
    get "/welcome"
    assert_response :success
  end

  test "index button" do
    get "/welcome"
    assert_select "h1", text: "Bienvenuee"
  end

end
