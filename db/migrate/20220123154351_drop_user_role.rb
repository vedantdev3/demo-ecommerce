class DropUserRole < ActiveRecord::Migration[6.1]
  def change
    drop_table :users_roles
  end
end
