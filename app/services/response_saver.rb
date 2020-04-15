class ResponseSaver

  def self.call(response, query_id)

    valid_keys = ["benefit", "provider", "place", "address", "phone", "toilet", "ramp", "car-park", "elevator",
      "locality"]

    response["data"].each do |response|
      begin
        response = response["attributes"].slice(*valid_keys).merge(response["attributes"]["dates"].slice("date"))
        result = Result.find_by(benefit: response["benefit"], provider: response["provider"], place: response["place"],
          address: response["address"])
        if result.nil?
          result = Result.create(response)
          Query.find(query_id).users.each { |u| UserFreshResult.create(user_id: u.id, result_id: result.id) }
        else
          result.update_attribute(:active, true)
        end
        result.query_results.find_or_create_by(query_id: query_id)
      rescue StandardError => e
        e.message
      end
    end 
  end
end