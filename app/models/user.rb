class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
end
