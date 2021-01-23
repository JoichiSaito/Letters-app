require 'rails_helper'

RSpec.feature "Relationships", type: :feature do
  scenario "フォローボタンを押す" do
    visit new_user_path
    fill_in "ユーザー名", with: "Judge"
    fill_in "メールアドレス", with: "newyork@example.com"
    fill_in "パスワード", with: "yankeeswin"
    fill_in "パスワード（確認）", with: "yankeeswin"
    click_button "保存"
    click_link "ログアウト"

    visit new_user_path
    fill_in "ユーザー名", with: "Hicks"
    fill_in "メールアドレス", with: "Hicks@example.com"
    fill_in "パスワード", with: "Hickswin"
    fill_in "パスワード（確認）", with: "Hickswin"
    click_button "保存"

    visit users_path
    click_link "Judge"

    expect(page).to have_content "フォローする"
    click_link "フォローする"

    expect(page).to have_content "フォロー解除"
    click_link "フォロー解除"

    expect(page).to have_content "フォローする"
  end
end
