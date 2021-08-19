class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
  has_many :order_details,dependent: :destroy
  has_many :orders,through: :order_details,source: :order

#税込み価格の計算
  def add_tax_price
      (self.price * 1.1).round
  end

  attachment :image
end
