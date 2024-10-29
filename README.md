# README

#### Ruby version
* 3.3.5

#### Database creation
- `rails db:create`
- `rails db:migrate`

#### Database initialization
1. Add stripe keys and stripe package prices ids to `Rails.credentials` by using
```rails credentials:edit``` with following format:
```
stripe:
  secret_key: sk_test_XXXXXXXXXXXXXX
  public_key: pk_test_XXXXXXXXXXXXXX
  webhook_signing_secret: whsec_XXXXXXXXXXXXXX
  packages:
    basic: price_XXXXXXXXXXXX
    pro: price_XXXXXXXXXXXXX
    enterprise: price_XXXXXXXXXXXXX
```
In that way stripe ids are hidden from the code and can be easily changed when needed. They will be accessed via `Package.name` as key.

2. `rails db:seed`

#### Run application
`rails s`

Home page will be available at `http://localhost:3000`
On main page you will have access to all packages and you can subscribe to them.
You can subscribe to multiple packages at once.

You can test checkouts with stripe test card numbers: https://docs.stripe.com/testing?testing-method=card-numbers#cards

You can test webhooks (which are not working properly atm) by using stripe cli: https://docs.stripe.com/stripe-cli
