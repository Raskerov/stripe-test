class RemoveStripeIdFromPackages < ActiveRecord::Migration[7.2]
  def change
    remove_column :packages, :stripe_id, :string
  end
end
