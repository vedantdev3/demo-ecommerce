class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.decimal :total
      t.integer :quantity
      t.integer :order_id
      t.integer :cart_id
      t.integer :product_id

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :cart_id
    add_index :order_items, :product_id
  end
end
