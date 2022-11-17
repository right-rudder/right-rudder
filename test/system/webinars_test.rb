require "application_system_test_case"

class WebinarsTest < ApplicationSystemTestCase
  setup do
    @webinar = webinars(:one)
  end

  test "visiting the index" do
    visit webinars_url
    assert_selector "h1", text: "Webinars"
  end

  test "should create webinar" do
    visit webinars_url
    click_on "New webinar"

    fill_in "Host", with: @webinar.host
    fill_in "Meta description", with: @webinar.meta_description
    fill_in "Meta keywords", with: @webinar.meta_keywords
    fill_in "Title", with: @webinar.title
    fill_in "Webinar date", with: @webinar.webinar_date
    click_on "Create Webinar"

    assert_text "Webinar was successfully created"
    click_on "Back"
  end

  test "should update Webinar" do
    visit webinar_url(@webinar)
    click_on "Edit this webinar", match: :first

    fill_in "Host", with: @webinar.host
    fill_in "Meta description", with: @webinar.meta_description
    fill_in "Meta keywords", with: @webinar.meta_keywords
    fill_in "Title", with: @webinar.title
    fill_in "Webinar date", with: @webinar.webinar_date
    click_on "Update Webinar"

    assert_text "Webinar was successfully updated"
    click_on "Back"
  end

  test "should destroy Webinar" do
    visit webinar_url(@webinar)
    click_on "Destroy this webinar", match: :first

    assert_text "Webinar was successfully destroyed"
  end
end
