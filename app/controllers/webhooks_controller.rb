class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    signature_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, :webhook_signing_secret)
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, signature_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      render json: {message: e}, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render json: {message: e}, status: 400
      return
    end

    puts 'Dupa'
    puts event


    user = User.find_by(stripe_id: event.data.object.client_reference_id)
    return unless user.present?

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      # Payment is successful and the subscription is created.
      save_subscription(event.data.object, user)

      SubscriptionMailer.with(user: user).subscription_created.deliver_now
    when 'invoice.payment_failed'
      # Payment failed and the subscription object is created with data
      save_subscription(checkout_session, user)
    else
      # This could be expanded further to handle more Stripe events, but this is a good starting point
      # Every case should be moved into separate service object
      puts "Unhandled event type: #{event.type}"
    end
  end

  private

  def save_subscription(checkout_session, user) # This can be moved to a service object for better code quality
    user.update(stripe_id: checkout_session.customer)

    stripe_subscription = Stripe::Subscription.retrieve(checkout_session.subscription)

    Subscription.create(
      customer_id: stripe_subscription.customer,
      current_period_start: Time.now.to_datetime, # TBD
      current_period_end: Time.now.to_datetime + 1.month, # TBD
      status: stripe_subscription.status,
      subscription_id: stripe_subscription.id,
      user: user,
      )
  end
end
