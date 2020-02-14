class Query < ApplicationRecord
    has_many :user_queries, dependent: :destroy
    has_many :users, through: :user_queries

    validates :case, :province, :locality, :benefit, presence: true, uniqueness: true
end
