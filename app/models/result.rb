class Result < ApplicationRecord
  has_many :query_results, dependent: :destroy
  has_many :queries, through: :query_results
  has_many :user_fresh_results, dependent: :destroy
  has_many :results, through: :user_fresh_results

  validates :benefit, uniqueness: { scope: [:provider, :place, :address] }

end
