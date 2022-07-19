require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "should not save without original" do
    link = Link.new
    assert_not link.save, "Super message"
  end
end
