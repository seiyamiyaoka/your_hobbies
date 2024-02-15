require 'rails_helper'

RSpec.describe Circle, type: :model do
  it { should belong_to(:owner).class_name('User') }
  it { should belong_to(:hobby) }
  it { should have_many(:user_circles).dependent(:destroy) }
  it { should have_many(:members).through(:user_circles).source(:user) }

  describe 'self.members_count' do
    it 'サークルに所属するメンバーの人数とサークル名を返す' do
      user = create(:user)
      user2 = create(:user, name: 'taro')
      hobby = create(:hobby)
      circle = create(:circle, owner: user, hobby: hobby)

      create(:user_circle, circle: circle, user: user)
      create(:user_circle, circle: circle, user: user2)
      expect(Circle.members_count.first.members_count).to eq 2
    end
  end
end
