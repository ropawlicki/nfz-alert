class AddValidationAndMailingStampsToResult < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :validated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :results, :mailing_ready_at, :datetime
  end
end
