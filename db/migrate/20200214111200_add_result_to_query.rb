class AddResultToQuery < ActiveRecord::Migration[6.0]
  def change
    add_column :queries, :result, :json
  end
end
