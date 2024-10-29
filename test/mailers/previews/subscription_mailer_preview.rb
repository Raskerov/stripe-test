# Preview all emails at http://localhost:3000/rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/subscription_mailer/subcription_created
  def subcription_created
    SubscriptionMailer.subcription_created
  end
end
