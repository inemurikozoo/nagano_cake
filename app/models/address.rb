class Address < ApplicationRecord
  belongs_to :customer

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :customer_id, presence: true


  def order_address
    self.postal_code + self.address + self.name
  end

  def address_display
    '〒' + postal_code + '　' + address + '　' + name
  end
end
