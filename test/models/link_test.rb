require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without original" do
    link = Link.new
    assert_not link.save
  end
end
