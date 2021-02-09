require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前・Eメール・パスワードがすべて登録されているもののみ有効" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  
  it "名前・Eメール・パスワードのいずれかが欠けていたら無効" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  
  it "パスワードとパスワード確認用が同じでない場合は無効" do
    user = FactoryBot.build(:user, password_confirmation: "87654321")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
  
  it "パスワードが8文字未満の場合は無効" do
    user = FactoryBot.build(:user, password: "1234567", password_confirmation: "1234567")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end
  
  it "Eメールが~@~.~の形でない場合は無効" do
    user = FactoryBot.build(:user, email: "hogehoge")
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end
end