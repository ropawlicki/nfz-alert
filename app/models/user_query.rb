class UserQuery < ApplicationRecord
  belongs_to :user
  belongs_to :query

  validates :user_id, uniqueness: { scope: :query_id }
  validates :user_id, :query_id , presence: true

  before_destroy do
    @query = self.query
  end

  after_destroy do
    @query.destroy unless @query.user_queries.any?
  end
end
