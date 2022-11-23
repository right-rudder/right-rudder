require "application_system_test_case"

class NewsletterEmailsTest < ApplicationSystemTestCase
  setup do
    @newsletter_email = newsletter_emails(:one)
  end

  test "visiting the index" do
    visit newsletter_emails_url
    assert_selector "h1", text: "Newsletter emails"
  end

  test "should create newsletter email" do
    visit newsletter_emails_url
    click_on "New newsletter email"

    fill_in "Email", with: @newsletter_email.email
    fill_in "Name", with: @newsletter_email.name
    click_on "Create Newsletter email"

    assert_text "Newsletter email was successfully created"
    click_on "Back"
  end

  test "should update Newsletter email" do
    visit newsletter_email_url(@newsletter_email)
    click_on "Edit this newsletter email", match: :first

    fill_in "Email", with: @newsletter_email.email
    fill_in "Name", with: @newsletter_email.name
    click_on "Update Newsletter email"

    assert_text "Newsletter email was successfully updated"
    click_on "Back"
  end

  test "should destroy Newsletter email" do
    visit newsletter_email_url(@newsletter_email)
    click_on "Destroy this newsletter email", match: :first

    assert_text "Newsletter email was successfully destroyed"
  end
end
