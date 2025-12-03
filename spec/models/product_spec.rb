require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "バリデーション" do
    it "名前・カテゴリ・価格があれば有効であること" do
      product = Product.new(
        name: "ポロシャツA",
        category: "shirt",
        price: 3000
      )
      expect(product).to be_valid
    end

    it "名前がないと無効であること" do
      product = Product.new(
        name: nil,
        category: "shirt",
        price: 3000
      )
      expect(product).to be_invalid
      expect(product.errors[:name]).to include("can't be blank").or include("を入力してください")
    end

    it "カテゴリがないと無効であること" do
      product = Product.new(
        name: "ポロシャツA",
        category: nil,
        price: 3000
      )
      expect(product).to be_invalid
      expect(product.errors[:category]).not_to be_empty
    end

    it "価格がないと無効であること" do
      product = Product.new(
        name: "ポロシャツA",
        category: "shirt",
        price: nil
      )
      expect(product).to be_invalid
      expect(product.errors[:price]).not_to be_empty
    end

    it "価格が0未満だと無効であること" do
      product = Product.new(
        name: "ポロシャツA",
        category: "shirt",
        price: -1
      )
      expect(product).to be_invalid
      expect(product.errors[:price]).not_to be_empty
    end
  end
end
