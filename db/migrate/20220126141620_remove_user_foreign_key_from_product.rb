class RemoveUserForeignKeyFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :products, :users
  end
end
