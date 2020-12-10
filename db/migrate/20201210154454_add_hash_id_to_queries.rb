class AddHashIdToQueries < ActiveRecord::Migration[6.0]
  def change
    add_column :queries, :hash_id, :string
  end
end
