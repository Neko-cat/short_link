require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  include RedisConcern

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

  test "should redis get link" do
    link = Link.find_by(short: @link.short)
    setLink = link.set_link(link.short, link.view)
    getLink = link.get_link(link.short)
    assert_equal "1", getLink
  end

  test "should redis increment view" do
    link = Link.find_by(short: @link.short)
    setLink = link.set_link(link.short, link.view)
    incrLink = link.increment_views(link.short)
    getLink = link.get_link(link.short)
    assert_equal "2", getLink
  end

end
