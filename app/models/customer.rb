class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses,dependent: :destroy
  
  has_many :orders,dependent: :destroy

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  #論理削除　
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
 
 validates :last_name, presence: true
 validates :first_name, presence: true
 validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナです"}
 validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナです"}
 validates :postal_code, presence: true, format: { with: /\A\d{7}\z/,message: "は7桁です"}
 validates :address, presence: true 
 validates :phone_number, presence: true ,format: { with: /\A\d{10,11}\z/,message: "は10桁もしくは11桁です"}

end
