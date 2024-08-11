require "test_helper"

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_comments_show_url
    assert_response :success
  end
end
