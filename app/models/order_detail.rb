class OrderDetail < ApplicationRecord
  enum making_status: {
     production_not_possible:0,#制作不可
     production_pending:1,#制作待ち
     in_production:2,#製作中
     production_complete:3,#制作
 }

<<<<<<< HEAD
 belongs_to :order 
 belongs_to :item
=======
  belongs_to :order
  belongs_to :item
  
>>>>>>> 7d614d156eedac79d6997e6a41028011a55a833f
end
