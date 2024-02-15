class User < ApplicationRecord
  validates :name, presence: true

  has_many :user_hobbies
  has_many :hobbies, through: :user_hobbies

  def search_by_hobby(hobby_name)
    hobbies.where(name: hobby_name)
  end
end
