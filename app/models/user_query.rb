class UserQuery < ApplicationRecord
  belongs_to :user
  belongs_to :query

  validates :user_id, :query_id, presence: true, uniqueness: true
end
