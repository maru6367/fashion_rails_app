class ProductImage < ApplicationRecord
  belongs_to :product

  validates :image_url, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end