class AddPriceToPackage < ActiveRecord::Migration[7.2]
  def change
    add_column :packages, :price, :integer
  end
end
