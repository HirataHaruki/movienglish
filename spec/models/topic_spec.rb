require 'rails_helper'

RSpec.describe Topic, type: :model do
  it "作品名・作品内容・難易度・お気に入りのセリフがすべて入っており、ログインしているユーザーのみ投稿可能" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.build(:topic, user_id: user.id)
    expect(topic).to be_valid
  end
  
  it "ユーザーがログインしていない場合、投稿不可能" do
    topic = FactoryBot.build(:topic)
    topic.valid?
    expect(topic.errors[:user]).to include("must exist")
  end
  
  it "作品名・作品内容・難易度・お気に入りのセリフのいずれかが欠けていたら無効" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.build(:topic, user_id: user.id, title: nil)
    topic.valid?
    expect(topic.errors[:title]).to include("can't be blank")
  end
  
  it "難易度が投稿画面にある選択肢以外のものであれば無効" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.build(:topic, user_id: user.id, level: "テスト")
    topic.valid?
    expect(topic.errors[:level]).to include("is not included in the list")
  end
end
