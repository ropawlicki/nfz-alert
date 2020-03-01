class Result < ApplicationRecord
  has_many :queries, through: :query_results
  has_many :query_results, dependent: :destroy

  validates :benefit, uniqueness: { scope: [:provider, :place, :address] }

end
