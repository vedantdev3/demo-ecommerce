class User < ApplicationRecord
  after_create :welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :products
  has_one :cart
  after_create :initialize_cart
  private
  def initialize_cart
    Cart.create(user: self)
  end

  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
