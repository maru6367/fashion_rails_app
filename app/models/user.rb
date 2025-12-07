class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :cart_items, dependent: :destroy
  has_many :cart_products, through: :cart_items, source: :product


  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :product


  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
     
    end
  end
end