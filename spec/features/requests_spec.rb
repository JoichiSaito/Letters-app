require 'rails_helper'

RSpec.feature "Requests", type: :feature do
  scenario "フォローリクエストボタンを押す" do
    user = FactoryBot.create(:user)
    sign_in_as user

    visit new_user_path
    fill_in "ユーザー名", with: "Judge"
    fill_in "メールアドレス", with: "newyork@example.com"
    fill_in "パスワード", with: "yankeeswin"
    fill_in "パスワード（確認）", with: "yankeeswin"
    click_button "保存"

    visit users_path
    click_link "Aaron"

    expect(page).to have_content "リクエスト送信"
    click_link "リクエスト送信"

    expect(page).to have_content "リクエスト取消"
  end
end
