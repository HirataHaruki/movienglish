require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "ユーザーがログイン済みである場合のみ投稿可能" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    comment = FactoryBot.build(:comment, user_id: user.id, topic_id: topic.id)
    expect(comment).to be_valid
  end
  
  it "ユーザーがログイン済みでない場合は投稿不可" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    comment = FactoryBot.build(:comment, user_id: nil, topic_id: topic.id)
    comment.valid?
    expect(comment.errors[:user]).to include("must exist")
  end
  
  it "コメント本文が空欄の場合は投稿不可" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    comment = FactoryBot.build(:comment, user_id: user.id, topic_id: topic.id, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
end
