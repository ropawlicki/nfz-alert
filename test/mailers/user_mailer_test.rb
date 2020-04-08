require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "update_query_email" do
    mail = UserMailer.update_query_email
    assert_equal "Update query email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
