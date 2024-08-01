require "test_helper"

class CustomerPortalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_portal_index_url
    assert_response :success
  end
end
