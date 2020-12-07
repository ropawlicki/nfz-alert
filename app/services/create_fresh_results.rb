# frozen_string_literal: true

class CreateFreshResults
  def self.call(query_id, result_id)
    Query.find(query_id).users.each { |u| UserFreshResult.create(user_id: u.id, result_id: result_id) }
  end
end
