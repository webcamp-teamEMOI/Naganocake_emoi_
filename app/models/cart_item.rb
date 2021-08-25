class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  # validates :amount, numericality: { only_integer: true, greater_than: 0, less_than: 21 }
end
