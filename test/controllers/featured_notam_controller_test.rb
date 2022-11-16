require "test_helper"

class FeaturedNotamControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get featured_notam_select_url
    assert_response :success
  end
end
