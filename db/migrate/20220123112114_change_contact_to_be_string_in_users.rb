class ChangeContactToBeStringInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :contact, :string
  end
end
