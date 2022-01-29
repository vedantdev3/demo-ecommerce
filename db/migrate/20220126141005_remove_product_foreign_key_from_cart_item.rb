class RemoveProductForeignKeyFromCartItem < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :cart_items, :products
  end
end
