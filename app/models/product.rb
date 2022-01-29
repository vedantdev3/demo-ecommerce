class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :description, presence: true
  belongs_to :user, :optional => true
end
