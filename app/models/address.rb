class Address < ApplicationRecord
  belongs_to :customer

   def address_all
   "〒" + self.postal_code + " " + self.address + " " + self.name
  end
end
