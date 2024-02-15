require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:content) }

  describe 'validation' do
    it "postをたてたcircleのメンバー以外はコメントできない" do
      user = create(:user, name: 'taro')
      baseball = create(:hobby, name: '野球')
      circle = create(:circle, name: '野球サークル', hobby: baseball, owner: user)
      user2 = create(:user, name: 'jiro')
      post = create(:post, user: user, circle: circle)
      comment = build(:comment, user: user2, post: post)
      comment.valid?
      expect(comment.errors.full_messages).to include('circleメンバー以外はコメントできません')
    end

  end

end
