class UserHobby < ApplicationRecord
  belongs_to :user
  belongs_to :hobby

  validates :user_id, uniqueness: { scope: :hobby_id }
end
