module ApplicationHelper


# 顧客フルネーム表示
  def full_name(customer)
    customer.last_name + customer.first_name
  end  
  
	def full_name_kana(customer)
	  customer.last_name_kana + customer.first_name_kana
	end
  
  def my_address
    "〒" + current_customer.postal_code + current_customer.address + current_customer.last_name + current_customer.first_name
  end
  
 
  
   # 税込単価の計算
  def tax_in_price(price)
    (price * 1.1).floor
  end
  
  # 税込み小計の計算
  def sub_total(sub)
    (tax_in_price(sub.item.price) * sub.amount)
  end
  
  
    #合計金額の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_total(total)
    end
    return price
  end
  
  def billing(order)
    total_price(current_customer.cart_items) + order
  end

end
