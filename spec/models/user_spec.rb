require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  it "名前が無ければ無効であること" do
    user = User.new(name: nil)
    expect(user).to be_invalid
  end

  it "メールアドレスが無ければ無効であること" do
    user = User.new(email: nil)
    expect(user).to be_invalid
  end

  it "パスワードが無ければ無効であること" do
    user = User.new(password: nil)
    expect(user).to be_invalid
  end
  
  it "名前が30文字以上であれば無効であること" do
    user = User.new(name: "a" * 31)
    expect(user).to be_invalid
  end

  it "重複したメールアドレスなら無効であること" do
    FactoryBot.create(:user)
    user2 = User.new(email: "tester@example.com")
    expect(user2).to be_invalid
  end
    
  it "パスワードが7文字以下であれば無効であること" do
    user = User.new(password: "a" * 6)
    expect(user).to be_invalid
  end
end
