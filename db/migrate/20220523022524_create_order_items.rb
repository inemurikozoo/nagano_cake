class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id,    null: false, default: ""
      t.integer :item_id,     null: false, default: ""
      t.integer :price,       null: false, default: ""
      t.integer :amount,      null: false, default: ""
      t.integer :status,      null: false, default: 0
      t.timestamps
    end
  end
end
