class Product < ApplicationRecord
  validates :name, :category, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
 
  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :product_images, dependent: :destroy
end
