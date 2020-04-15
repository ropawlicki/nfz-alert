class UserFreshResult < ApplicationRecord
  belongs_to :user
  belongs_to :result

  validates :user_id, uniqueness: { scope: :result_id }
  validates :user_id, :result_id , presence: true
end
