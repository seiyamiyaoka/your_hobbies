require 'rails_helper'

RSpec.describe UserHobby, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:hobby) }
  
  describe 'uniqueness' do
    it 'user_idとhobby_idの組み合わせは一意であること' do
      user = create(:user, name: 'taro')
      hobby = create(:hobby, name: '野球')
      create(:user_hobby, user: user, hobby: hobby)
      another_user_hobby = build(:user_hobby, user: user, hobby: hobby)
      another_user_hobby.valid?
      expect(another_user_hobby.errors.full_messages).to include('User has already been taken')
    end
  end
end
