class AddDetailsToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :name, :string
    add_column :orders, :mobile, :string
    add_column :orders, :address, :text
    add_column :orders, :city, :string
    add_column :orders, :pincode, :string
    add_column :orders, :state, :string
  end
end
