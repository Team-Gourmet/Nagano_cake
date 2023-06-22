class ShippingAddress < ApplicationRecord
  belongs_to :costomer, optional: true
  
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
