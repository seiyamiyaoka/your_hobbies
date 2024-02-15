require 'rails_helper'

RSpec.describe Hobby, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should have_many(:user_hobbies) }
  it { should have_many(:users).through(:user_hobbies) }
  it { should have_many(:circles).dependent(:destroy) }

  describe 'positive_comments' do
    it 'postのcommentでいいねという文字が含まれているもの' do
      hobby = create(:hobby)
      user = create(:user)
      circle = create(:circle, hobby: hobby, owner: user)
      create(:user_circle, user: user, circle: circle)
      post = create(:post, circle: circle, user: user)
      counter = 19

      counter.times do
        create(:comment, post: post, user: user, content: 'いいね')
      end

      create(:comment, post: post, user: user, content: 'わるいね')

      expect(Hobby.positive_comments.map(&:content)).not_to include('わるいね')
      expect(Hobby.positive_comments.map(&:content)).to include('いいね')
      expect(Comment.count).to eq 20
      binding.pry

    end
  end

end
