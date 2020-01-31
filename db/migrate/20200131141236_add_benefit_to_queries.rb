class AddBenefitToQueries < ActiveRecord::Migration[6.0]
  def change
    add_column :queries, :benefit, :string
  end
end
