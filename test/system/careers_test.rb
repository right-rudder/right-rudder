require "application_system_test_case"

class CareersTest < ApplicationSystemTestCase
  setup do
    @career = careers(:one)
  end

  test "visiting the index" do
    visit careers_url
    assert_selector "h1", text: "Careers"
  end

  test "should create career" do
    visit careers_url
    click_on "New career"

    fill_in "Location", with: @career.location
    fill_in "Post date", with: @career.post_date
    fill_in "Role", with: @career.role
    click_on "Create Career"

    assert_text "Career was successfully created"
    click_on "Back"
  end

  test "should update Career" do
    visit career_url(@career)
    click_on "Edit this career", match: :first

    fill_in "Location", with: @career.location
    fill_in "Post date", with: @career.post_date
    fill_in "Role", with: @career.role
    click_on "Update Career"

    assert_text "Career was successfully updated"
    click_on "Back"
  end

  test "should destroy Career" do
    visit career_url(@career)
    click_on "Destroy this career", match: :first

    assert_text "Career was successfully destroyed"
  end
end
