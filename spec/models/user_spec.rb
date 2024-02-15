require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }

  describe 'search_by_hobby' do
    let(:user) { create(:user) }
    let(:hobby1) { create(:hobby, name: '野球') }
    let(:hobby2) { create(:hobby, name: 'サッカー') }
    let(:hobby3) { create(:hobby, name: 'バスケ') }

    before do
      create(:user_hobby, user: user, hobby: hobby1)
      create(:user_hobby, user: user, hobby: hobby2)
    end

    context '指定した趣味を持つユーザーがいないとき' do
      it '空のコレクションを返すこと' do
        expect(user.search_by_hobby('バスケ')).to be_empty
      end
    end

    it '指定した趣味を持つユーザーを返すこと' do
      expect(user.search_by_hobby('野球')).to include(hobby1)
      binding.pry
    end
  end
end
