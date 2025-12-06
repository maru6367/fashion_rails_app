# spec/system/favorites_spec.rb
require "rails_helper"

RSpec.describe "お気に入り機能", type: :system do
  let!(:user) do
    User.create!(
      email: "favorite_system_test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  let!(:product) do
    Product.create!(
      name: "テストスニーカー",
      price: 12000,
      category: "sneakers",
      image_url: "https://via.placeholder.com/400x300?text=Test+Sneaker"
    )
  end

  # ログイン用ヘルパー
  def login_as(user)
    visit new_user_session_path

    # Devise のログインフォームだけを対象にする
    within("form#new_user") do
      # フィールドの id を指定するので、日本語ラベルでもOK
      fill_in "user_email", with: user.email
      fill_in "user_password", with: "password"

      # ボタン文字に依存せず submit を押す
      find("input[type='submit']").click
    end
  end

  it "商品をお気に入りに追加し、お気に入り一覧に表示される" do
    # ログイン
    login_as(user)

    # 商品詳細ページへ
    visit product_path(product)

    # 「お気に入りに追加」ボタンを押す
    click_button "お気に入りに追加"

    # フラッシュメッセージ確認（FavoritesController#create の notice と合わせる）
    expect(page).to have_content "お気に入りに追加しました。"

    # お気に入り一覧ページへ
    visit favorites_path

    # 追加した商品が表示されていること
    expect(page).to have_content "テストスニーカー"
  end
end