class Address < ApplicationRecord
  belongs_to :customer

  def address_all
   "〒" + self.postal_code + " " + self.address + " " + self.name
  end
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end
