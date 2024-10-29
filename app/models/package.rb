class Package < ApplicationRecord

  def formatted_price
    price * 100 # Cent to dollar conversion
  end
end
