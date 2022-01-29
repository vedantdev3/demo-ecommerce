class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_one :cart
  after_create :initialize_cart
  private
  def initialize_cart
    Cart.create(user: self)
  end
end
