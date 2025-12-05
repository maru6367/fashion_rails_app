require "rails_helper"

RSpec.describe "カテゴリナビゲーション", type: :system do
  before do
    
    Product.create!(name: "ポロシャツA", category: "shirt",  price: 3000)
    Product.create!(name: "スウェットA", category: "sweat", price: 5000)
    Product.create!(name: "アフタージャケットA", category: "after", price: 12000)
    Product.create!(name: "パンツA", category: "pants", price: 7000)
    Product.create!(name: "スニーカーA", category: "sneaker", price: 8000)
  end

  it "ホーム画面で商品一覧が表示されること" do
    visit root_path

    expect(page).to have_content "ポロシャツA"
    expect(page).to have_content "スウェットA"
    expect(page).to have_content "アフタージャケットA"
    expect(page).to have_content "パンツA"
    expect(page).to have_content "スニーカーA"
  end

  it "ナビバーに各カテゴリへのリンクが表示されていること" do
    visit root_path

    expect(page).to have_link "シャツ",    href: shirts_path
    expect(page).to have_link "スウェット", href: sweats_path
    expect(page).to have_link "アフター",  href: afters_path
    expect(page).to have_link "パンツ",    href: pants_path
    expect(page).to have_link "スニーカー", href: sneakers_path
  end

  it "ナビバーの『スニーカー』リンクからスニーカー一覧ページに遷移し、スニーカーのみが表示されること" do
    visit root_path
    click_link "スニーカー"

    expect(current_path).to eq sneakers_path
    expect(page).to have_content "スニーカーA"

    expect(page).not_to have_content "ポロシャツA"
    expect(page).not_to have_content "パンツA"
  end

  it "ナビバーの『シャツ』リンクからシャツ一覧ページに遷移し、シャツのみが表示されること" do
    visit root_path
    click_link "シャツ"

    expect(current_path).to eq shirts_path
    expect(page).to have_content "ポロシャツA"

    expect(page).not_to have_content "スニーカーA"
    expect(page).not_to have_content "スウェットA"
  end
end