# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(email: 'tester@test.test', first_name: 'Tester', last_name: 'Testowy')
Package.create!(name: 'Basic', stripe_id: Rails.application.credentials.dig(:stripe, :packages, :basic))
Package.create!(name: 'Pro', stripe_id: Rails.application.credentials.dig(:stripe, :packages, :pro))
Package.create!(name: 'Enterprise', stripe_id: Rails.application.credentials.dig(:stripe, :packages, :enterprise))
