class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  # 税込み小計の計算
  def sub_total(sub)
    (tax_in_price(sub.item.price) * sub.amount)
  end
end
