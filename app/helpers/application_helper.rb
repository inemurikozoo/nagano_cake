module ApplicationHelper

# 税込み価格の計算
  def tax_in_price(price)
    (price * 1.1).floor
  end

# 税込み小計の計算
  def subtotal(sub)
    ( tax_in_price(sub.price) *  sub.amount )
  end


# 顧客フルネーム表示
  def full_name(customer)
    customer.last_name + customer.first_name
  end  
  
	def full_name_kana(customer)
	  customer.last_name_kana + customer.first_name_kana
	end
  
  #合計金額の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end
end
