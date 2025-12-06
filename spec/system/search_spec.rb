require "rails_helper"

RSpec.describe "商品検索", type: :system do
  let!(:product1) do
    Product.create!(
      name: "テストシャツ",
      price: 5000,
      category: "shirts",
      image_url: "https://via.placeholder.com/400x300?text=Shirt"
    )
  end

  let!(:product2) do
    Product.create!(
      name: "テストスニーカー",
      price: 12000,
      category: "sneakers",
      image_url: "https://via.placeholder.com/400x300?text=Sneaker"
    )
  end

  it "キーワードで商品を絞り込める" do
    visit root_path

    # ナビバーの検索欄に入力（プレースホルダで指定）
    fill_in "商品名・カテゴリで検索", with: "シャツ"
    click_button "検索"

    expect(page).to have_content "テストシャツ"
    expect(page).not_to have_content "テストスニーカー"
  end
end