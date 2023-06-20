class Item < ApplicationRecord
  belongs_to :genre
  has_many :carts, dependent: :destroy
  has_many :order_details
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
   (price * 1.1).floor
  end


end
