class OrderItem < ApplicationRecord
  enum status: {not_startable: 0, waiting: 1, producting: 2, complete: 3}
end
