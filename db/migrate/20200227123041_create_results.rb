class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.string :benefit
      t.string :provider
      t.string :place
      t.string :address
      t.string :phone
      t.string :toilet
      t.string :ramp
      t.string :'car-park'
      t.string :elevator
      t.string :locality
      t.string :date
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :results, [:benefit, :provider, :place, :address], unique: true
  end
end
