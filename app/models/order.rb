class Order < ApplicationRecord
  enum payment_method: {
        credit_card:0,#クレジットカード
        bank_payment:1,#銀行払い
    }

    enum status: {
        payment_waiting:0,#入金待ち
        payment_confirmation:1,#入金確認
        in_production:2,#製作中
        preparing_delivery:3,#発送準備中
        delivered:4,#発送済み
    }
    
    has_many :order_details,dependent: :destroy
<<<<<<< HEAD
    has_many :items, through: :order_details　#中間テーブル
    
    belongs_to :customer
    
=======

    belongs_to :customer
    
    has_many :items,through: :order_details,source: :item
   

>>>>>>> 7d614d156eedac79d6997e6a41028011a55a833f
    
end
