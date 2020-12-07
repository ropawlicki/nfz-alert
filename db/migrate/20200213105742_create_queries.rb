# frozen_string_literal: true

class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.integer :case
      t.string :province
      t.string :locality
      t.string :benefit

      t.timestamps
    end

    add_index :queries, %i[case province locality benefit], unique: true
  end
end
