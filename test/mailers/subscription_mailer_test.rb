require "test_helper"

class SubscriptionMailerTest < ActionMailer::TestCase
  test "subcription_created" do
    mail = SubscriptionMailer.subcription_created
    assert_equal "Subcription created", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
