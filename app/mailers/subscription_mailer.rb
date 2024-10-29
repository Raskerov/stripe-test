class SubscriptionMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.subscription_created.subject
  #
  def subscription_created(user)
    mail to: user.email, subject: "Subscribed!"
  end
end
