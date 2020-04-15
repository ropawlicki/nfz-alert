class AddIndexToUserFreshResults < ActiveRecord::Migration[6.0]
  def change
    add_index :user_fresh_results, [:user_id, :result_id], unique: true
  end
end
