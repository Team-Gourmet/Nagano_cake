class ShippingAddress < ApplicationRecord
  belongs_to :customer, optional: true

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
end
