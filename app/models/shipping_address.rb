class ShippingAddress < ApplicationRecord
  belongs_to :costomer, optional: true

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
end
