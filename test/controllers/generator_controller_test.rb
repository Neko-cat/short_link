require 'test_helper'

class GeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/generator/index"
    assert_response :success
  end
end
