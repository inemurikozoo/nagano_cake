class Order < ApplicationRecord
  enum payment_method: {credit_card: 0, transfer: 1 }
  enum status: {not_payment: 0, payment_comfirm: 1, producting: 2,　ready_to_ship: 3, sent: 4}
end
