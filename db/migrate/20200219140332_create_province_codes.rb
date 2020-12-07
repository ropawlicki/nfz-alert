# frozen_string_literal: true

class CreateProvinceCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :province_codes do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
