require "rails_helper"

RSpec.describe ProductImage, type: :model do

  let(:product) do
    Product.create!(
      name:        "テスト商品",
      category:    "sneaker",           
      price:       1000,
      description: "テスト用の説明文です。",
      image_url:   "dummy.jpg"
    )
  end

  it "product と image_url があれば有効である" do
    image = ProductImage.new(product: product, image_url: "test.jpg", position: 1)
    expect(image).to be_valid
  end

  it "image_url がないと無効である" do
    image = ProductImage.new(product: product, image_url: nil, position: 1)
    expect(image).not_to be_valid
  end
end