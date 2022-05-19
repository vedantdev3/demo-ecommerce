class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total
      t.integer :user_id
      t.date :date

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
