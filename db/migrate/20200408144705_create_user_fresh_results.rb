class CreateUserFreshResults < ActiveRecord::Migration[6.0]
  def change
    create_table :user_fresh_results do |t|
      t.references :user
      t.references :result

      t.timestamps
    end
  end
end
