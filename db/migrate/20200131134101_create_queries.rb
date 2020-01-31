class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :case
      t.string :province
      t.string :locality

      t.timestamps
    end
  end
end
