# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def set_hash_id
    loop do
      self.hash_id = SecureRandom.urlsafe_base64(5)
      return hash_id if self.class.find_by(hash_id: hash_id).nil?
    end
  end
end
