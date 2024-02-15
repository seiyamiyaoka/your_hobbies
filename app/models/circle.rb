class Circle < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :hobby

  has_many :user_circles, dependent: :destroy
  has_many :members, through: :user_circles, source: :user
  has_many :posts, dependent: :destroy

  # サークルに所属するメンバーの人数とサークル名を返す

  def self.members_count
    select('circles.*, COUNT(user_circles.id) AS members_count')
      .joins(:user_circles)
      .group('circles.id')
  end
end
