# frozen_string_literal: true

class CreateQuery
  def self.call(params, user_id)
    params.each_value(&:capitalize!)
    query = Query.find_by(params)
    if query.nil?
      query = Query.create(params)
      InitialSearch.call(query.id)
    end
    query.user_queries.find_or_create_by(user_id: user_id)
    query
  end
end
