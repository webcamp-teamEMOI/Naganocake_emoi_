class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

#税込み価格の計算
  def add_tax_price
      (self.price * 1.1).round
  end

  attachment :image
end
