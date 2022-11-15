require "application_system_test_case"

class NotamsTest < ApplicationSystemTestCase
  setup do
    @notam = notams(:one)
  end

  test "visiting the index" do
    visit notams_url
    assert_selector "h1", text: "Notams"
  end

  test "should create notam" do
    visit notams_url
    click_on "New notam"

    fill_in "Author", with: @notam.author
    fill_in "Notam body", with: @notam.notam_body
    fill_in "Notam date", with: @notam.notam_date
    fill_in "Title", with: @notam.title
    click_on "Create Notam"

    assert_text "Notam was successfully created"
    click_on "Back"
  end

  test "should update Notam" do
    visit notam_url(@notam)
    click_on "Edit this notam", match: :first

    fill_in "Author", with: @notam.author
    fill_in "Notam body", with: @notam.notam_body
    fill_in "Notam date", with: @notam.notam_date
    fill_in "Title", with: @notam.title
    click_on "Update Notam"

    assert_text "Notam was successfully updated"
    click_on "Back"
  end

  test "should destroy Notam" do
    visit notam_url(@notam)
    click_on "Destroy this notam", match: :first

    assert_text "Notam was successfully destroyed"
  end
end
