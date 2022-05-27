class OrderItem < ApplicationRecord
  enum status: {not_startable: 0, waiting: 1, producting: 2, complete: 3}
  belongs_to :order
  belongs_to :item
end
