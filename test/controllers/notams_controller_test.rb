require "test_helper"

class NotamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notam = notams(:one)
  end

  test "should get index" do
    get notams_url
    assert_response :success
  end

  test "should get new" do
    get new_notam_url
    assert_response :success
  end

  test "should create notam" do
    assert_difference("Notam.count") do
      post notams_url, params: { notam: { author: @notam.author, notam_body: @notam.notam_body, notam_date: @notam.notam_date, title: @notam.title } }
    end

    assert_redirected_to notam_url(Notam.last)
  end

  test "should show notam" do
    get notam_url(@notam)
    assert_response :success
  end

  test "should get edit" do
    get edit_notam_url(@notam)
    assert_response :success
  end

  test "should update notam" do
    patch notam_url(@notam), params: { notam: { author: @notam.author, notam_body: @notam.notam_body, notam_date: @notam.notam_date, title: @notam.title } }
    assert_redirected_to notam_url(@notam)
  end

  test "should destroy notam" do
    assert_difference("Notam.count", -1) do
      delete notam_url(@notam)
    end

    assert_redirected_to notams_url
  end
end
