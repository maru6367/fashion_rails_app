require "rails_helper"

RSpec.describe "カート機能", type: :system do
  let!(:product) do
    Product.create!(
      name: "テストシャツ",
      price: 3000,
      category: "shirts",
      image_url: nil
    )
  end

  it "商品一覧からカートに追加して、カート画面に表示されること" do
    # まずはゲストログイン（既に実装済みの機能をそのまま利用）
    visit root_path
    click_button "ゲストログイン"

    # ホーム画面に商品が表示されている前提
    expect(page).to have_content "テストシャツ"

    # 「カートに追加」ボタンをクリック
    click_button "カートに追加"

    # Flashメッセージが出るなら確認（文言は実装に合わせて変更）
    # expect(page).to have_content "カートに商品を追加しました"

    # ナビバーの「カート」をクリックしてカート画面へ
    click_link "カート"

    # カート画面で商品名・価格・数量が表示されているか
    expect(page).to have_content "テストシャツ"
    expect(page).to have_content "¥3000"
    expect(page).to have_field "cart_item[quantity]", with: "1"
  end
end