class CreateQueryResults < ActiveRecord::Migration[6.0]
  def change
    create_table :query_results do |t|
      t.references :query, null: false, foreign_key: true
      t.references :result, null: false, foreign_key: true

      t.timestamps
    end

    add_index :query_results, [:query_id, :result_id], unique: true
  end
end
