require 'test_helper'

class GeneratorControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @userTwo = users(:two)
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

  test "should link redirect" do
    get "/generator/" + @link.id.to_s
    assert_redirected_to "/welcome"
  end

  test "should redirect to welcome page if short doesn't exist" do
    short = "Df56tL"
    get "/:" + short
    assert_redirected_to "/welcome"
  end

  test "should not show other people links" do
    sign_in @userTwo
    get "/generator/" + @link.id.to_s
    assert_redirected_to root_path
  end

  test "should only show to author" do
    sign_in @user
    get "/generator/" + @link.id.to_s
    assert_response :success
  end

end
