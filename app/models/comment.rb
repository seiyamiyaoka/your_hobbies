class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
  # postをたてたcircleのメンバー以外はコメントできない
  validate :circle_member_only

  private

  def circle_member_only
    return if post&.circle&.members&.include?(user)

    errors.add(:base, 'circleメンバー以外はコメントできません')
  end
end
