require "test_helper"

class CheckListMailerTest < ActionMailer::TestCase
  test "check_list" do
    mail = CheckListMailer.check_list
    assert_equal "Check list", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
