require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  feature "Visit" do
    scenario "ログイン" do
      visit login_path

      expect(page).to have_text("メールアドレス")
      expect(page).to have_text("パスワード")
    end
  end

  feature "New controll" do
    scenario "ログイン成功" do
      user = FactoryBot.create(:user)
      sign_in_as user
      
      expect(page).to have_http_status :ok
      expect(current_path).to eq mypage_path
      expect(page).to have_text("ログインしました")
      expect(page).to have_text("マイページ")
    end
  end
end
