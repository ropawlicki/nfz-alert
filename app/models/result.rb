# frozen_string_literal: true

class Result < ApplicationRecord
  has_many :query_results, dependent: :destroy
  has_many :queries, through: :query_results

  validates :benefit, uniqueness: { scope: %i[provider place address] }
end
