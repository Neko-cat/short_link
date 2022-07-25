require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @link = links(:one)
  end

  test "should not save without original" do
    link = Link.new
    assert_not link.save, "Original link is missing"
  end

  test "should view equal to zero" do
    link = Link.new
    view = link.view
    assert_equal 0, view, "View isn't equal to zero"
  end

  test "should return random six length string" do
    short = Link.generate_unique_short
    assert_equal 6, short.length, "Length isn't equal to six"
  end

end
