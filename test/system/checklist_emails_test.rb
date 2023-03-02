require "application_system_test_case"

class ChecklistEmailsTest < ApplicationSystemTestCase
  setup do
    @checklist_email = checklist_emails(:one)
  end

  test "visiting the index" do
    visit checklist_emails_url
    assert_selector "h1", text: "Checklist emails"
  end

  test "should create checklist email" do
    visit checklist_emails_url
    click_on "New checklist email"

    fill_in "Email", with: @checklist_email.email
    fill_in "Name", with: @checklist_email.name
    fill_in "Phone", with: @checklist_email.phone
    click_on "Create Checklist email"

    assert_text "Checklist email was successfully created"
    click_on "Back"
  end

  test "should update Checklist email" do
    visit checklist_email_url(@checklist_email)
    click_on "Edit this checklist email", match: :first

    fill_in "Email", with: @checklist_email.email
    fill_in "Name", with: @checklist_email.name
    fill_in "Phone", with: @checklist_email.phone
    click_on "Update Checklist email"

    assert_text "Checklist email was successfully updated"
    click_on "Back"
  end

  test "should destroy Checklist email" do
    visit checklist_email_url(@checklist_email)
    click_on "Destroy this checklist email", match: :first

    assert_text "Checklist email was successfully destroyed"
  end
end
