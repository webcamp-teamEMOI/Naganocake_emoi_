class Item < ApplicationRecord

#税込み価格の計算
  def add_tax_price
      (self.price * 1.1).roundgit
  end
end
