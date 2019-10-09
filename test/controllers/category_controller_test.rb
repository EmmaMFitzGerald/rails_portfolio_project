require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get title" do
    get category_title_url
    assert_response :success
  end

end
