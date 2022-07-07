module ApplicationHelper


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
      price += sub_total(total)
    end
    return price
  end

end
