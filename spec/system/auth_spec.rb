# spec/system/auth_spec.rb
require "rails_helper"

RSpec.describe "認証", type: :system do
  let(:user_email)    { "test@example.com" }
  let(:user_password) { "password123" }

  it "ユーザー登録ができること" do
    visit new_user_registration_path

    fill_in "user[email]",                 with: user_email
    fill_in "user[password]",              with: user_password
    fill_in "user[password_confirmation]", with: user_password

    if page.has_button?("新規登録")
      click_button "新規登録"
    elsif page.has_button?("Sign up")
      click_button "Sign up"
    else
      find('input[type="submit"]').click
    end

    expect(page).to have_link "ログアウト"
  end

  it "ゲストログインができること" do
    visit root_path
    click_button "ゲストログイン"

    expect(page).to have_link "ログアウト"
    expect(page).to have_link "マイページ"
  end
end