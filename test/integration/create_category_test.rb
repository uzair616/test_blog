require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = User.create(username: "johndoe", email: "jhordoe@gmail.com",
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  end
  test "get new category from the create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category from and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "}}
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h2.alert-heading'
  end
end
