# frozen_string_literal: true

class QueryResult < ApplicationRecord
  belongs_to :query
  belongs_to :result
end
