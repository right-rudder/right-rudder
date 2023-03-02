require "test_helper"

class ChecklistEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checklist_email = checklist_emails(:one)
  end

  test "should get index" do
    get checklist_emails_url
    assert_response :success
  end

  test "should get new" do
    get new_checklist_email_url
    assert_response :success
  end

  test "should create checklist_email" do
    assert_difference("ChecklistEmail.count") do
      post checklist_emails_url, params: { checklist_email: { email: @checklist_email.email, name: @checklist_email.name, phone: @checklist_email.phone } }
    end

    assert_redirected_to checklist_email_url(ChecklistEmail.last)
  end

  test "should show checklist_email" do
    get checklist_email_url(@checklist_email)
    assert_response :success
  end

  test "should get edit" do
    get edit_checklist_email_url(@checklist_email)
    assert_response :success
  end

  test "should update checklist_email" do
    patch checklist_email_url(@checklist_email), params: { checklist_email: { email: @checklist_email.email, name: @checklist_email.name, phone: @checklist_email.phone } }
    assert_redirected_to checklist_email_url(@checklist_email)
  end

  test "should destroy checklist_email" do
    assert_difference("ChecklistEmail.count", -1) do
      delete checklist_email_url(@checklist_email)
    end

    assert_redirected_to checklist_emails_url
  end
end
