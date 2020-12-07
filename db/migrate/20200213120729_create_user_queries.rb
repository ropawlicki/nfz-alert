# frozen_string_literal: true

class CreateUserQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :user_queries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :query, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_queries, %i[user_id query_id], unique: true
  end
end
