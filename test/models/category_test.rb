require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Sports")
  end
  test "category should be valid" do
    assert @category.valid?
  end
  test "name should be present" do
    @category.name=" "
    assert_not @category.valid?
  end
  test "name should be unique" do
    @category.save
    @category2 =Category.new(name: "Sports")
    assert_not @category2.valid?
  end
  test "name is too long" do
    @category.name = "aa"*26
    assert_not @category.valid?
  end
  test "name is too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end