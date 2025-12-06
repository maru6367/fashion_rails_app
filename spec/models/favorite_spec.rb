require "rails_helper"

RSpec.describe Favorite, type: :model do
  it "ユーザーと商品があれば有効である" do
    user = User.create!(
      email: "favorite_test1@example.com",
      password: "password",
      password_confirmation: "password"
    )

    product = Product.create!(
      name: "テスト商品1",
      price: 1000,
      category: "shirts",
      image_url: "test1.jpg"
    )

    favorite = Favorite.new(user: user, product: product)

    expect(favorite).to be_valid
  end

  it "同じユーザーが同じ商品を重複登録できない" do
    user = User.create!(
      email: "favorite_test2@example.com",
      password: "password",
      password_confirmation: "password"
    )

    product = Product.create!(
      name: "テスト商品2",
      price: 2000,
      category: "sneakers",
      image_url: "test2.jpg"
    )


    Favorite.create!(user: user, product: product)

    duplicate = Favorite.new(user: user, product: product)

    expect(duplicate).not_to be_valid
  end
end