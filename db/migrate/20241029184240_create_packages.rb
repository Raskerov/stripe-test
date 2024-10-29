class CreatePackages < ActiveRecord::Migration[7.2]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.string :stripe_id, null: false

      t.timestamps
    end
  end
end
