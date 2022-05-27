class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :detroy
  belongs_to :genre
end
