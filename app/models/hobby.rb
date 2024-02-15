class Hobby < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :user_hobbies
  has_many :users, through: :user_hobbies
  has_many :circles, dependent: :destroy


  # postのcommentでいいねという文字が含まれているもの
  def self.positive_comments
    joins({ circles: [posts: :comments] })
      .where(comments: { content: 'いいね' })
      .select('comments.*')
  end
end
