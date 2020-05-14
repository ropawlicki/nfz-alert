class AddLastSentAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_sent_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
