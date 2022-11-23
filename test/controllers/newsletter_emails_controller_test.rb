require "test_helper"

class NewsletterEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsletter_email = newsletter_emails(:one)
  end

  test "should get index" do
    get newsletter_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_newsletter_email_url
    assert_response :success
  end

  test "should create newsletter_email" do
    assert_difference("NewsletterEmail.count") do
      post newsletter_emails_url, params: { newsletter_email: { email: @newsletter_email.email, name: @newsletter_email.name } }
    end

    assert_redirected_to newsletter_email_url(NewsletterEmail.last)
  end

  test "should show newsletter_email" do
    get newsletter_email_url(@newsletter_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_newsletter_email_url(@newsletter_email)
    assert_response :success
  end

  test "should update newsletter_email" do
    patch newsletter_email_url(@newsletter_email), params: { newsletter_email: { email: @newsletter_email.email, name: @newsletter_email.name } }
    assert_redirected_to newsletter_email_url(@newsletter_email)
  end

  test "should destroy newsletter_email" do
    assert_difference("NewsletterEmail.count", -1) do
      delete newsletter_email_url(@newsletter_email)
    end

    assert_redirected_to newsletter_emails_url
  end
end
