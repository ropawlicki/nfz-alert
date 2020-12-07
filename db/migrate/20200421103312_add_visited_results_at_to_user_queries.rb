# frozen_string_literal: true

class AddVisitedResultsAtToUserQueries < ActiveRecord::Migration[6.0]
  def change
    add_column :user_queries, :visited_results_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
