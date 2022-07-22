require 'test_helper'

class GeneratorControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @link = links(:one)
  end

  test "should redirect index" do
    get root_path
    assert_response :redirect
  end

  test "should get index" do
    sign_in @user
    get root_path
    assert_response :success
  end

  test "should link exist" do
    sign_in @user
    get "/generator/" + @link.id.to_s
    assert_response :success
  end

  test "should link redirect" do
    get "/generator/" + @link.id.to_s
    assert_response :redirect
  end

end
