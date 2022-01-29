class RemoveUserForeignKeyFromCart < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :carts, :users
  end
end
