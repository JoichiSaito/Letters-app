require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature "Visit" do
    scenario "新規登録ページ" do
      visit new_user_path

      expect(page).to have_text("メールアドレス")
      expect(page).to have_text("パスワード")
    end
  end
  
  feature "New controll" do
    scenario "ユーザーの新規登録" do
      expect {
        visit new_user_path
        fill_in "ユーザー名", with: "Aaron"
        fill_in "メールアドレス", with: "tester@example.com"
        fill_in "パスワード", with: "dottle-nouveau"
        fill_in "パスワード（確認）", with: "dottle-nouveau"
        click_button "保存"

        expect(page).to have_http_status :ok
        expect(current_path).to eq mypage_path
        expect(page).to have_text("マイページ")
        expect(page).to have_text("Aaron")
      }.to change(User, :count).by(1)
    end
  end

  feature "Visit as loginuser" do
    scenario "フォローページ" do
      user = FactoryBot.create(:user)
      sign_in_as user

      visit mypage_path
      click_link "フォロー"
      expect(page).to have_http_status :ok
      expect(current_path).to eq follows_user_path(user)
      expect(page).to have_text("フォロー")
    end

    scenario "フォロワーページ" do
      user = FactoryBot.create(:user)
      sign_in_as user

      visit mypage_path
      click_link "フォロワー"
      expect(page).to have_http_status :ok
      expect(current_path).to eq followers_user_path(user)
      expect(page).to have_text("フォロワー")
    end

    scenario "フォローリクエスト一覧ページ" do
      user = FactoryBot.create(:user)
      sign_in_as user

      visit mypage_path
      click_link "フォローリクエスト一覧"
      expect(page).to have_http_status :ok
      expect(page).to have_text("フォローリクエスト一覧")
    end
  end

  feature "Edit controll" do
    scenario "ユーザー情報の更新" do
      user = FactoryBot.create(:user)
      sign_in_as user

      visit edit_user_path(user)
      fill_in "ユーザー名", with: "Judge"
      fill_in "メールアドレス", with: "tester@example.com"
      fill_in "パスワード", with: "dottle-nouveau"
      fill_in "パスワード（確認）", with: "dottle-nouveau"
      click_button "保存"

      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_path
      expect(page).to have_text("マイページ")
      expect(page).to have_text("Judge")
    end
  end

  feature "Login as guestuser" do
    scenario "ゲストユーザー" do
      visit root_path
      click_link "新規登録"
      
      fill_in "ユーザー名", with: "Rails太郎"
      fill_in "メールアドレス", with: "rails@taro.com"
      fill_in "パスワード", with: "railstaro"
      fill_in "パスワード（確認）", with: "railstaro"
      click_button "保存"

      expect(current_path).to eq mypage_path
      expect(page).to have_text("Rails太郎")

      click_link "編集"
      expect(current_path).to eq root_path
      expect(page).to have_text("権限がありません")
    end
  end
end
