class ResponseSaver

  def self.call(response, query_id)

    valid_keys = ["benefit", "provider", "place", "address", "phone", "toilet", "ramp", "car-park", "elevator",
      "locality"]

    response["data"].each do |response|
      begin
        response = response["attributes"].slice(*valid_keys).merge(response["attributes"]["dates"].slice("date"))
        result = Result.find_by(benefit: response["benefit"], provider: response["provider"], place: response["place"],
          address: response["address"])
        result.nil? ? result = Result.create(response) : result.update_attribute(:active, true)
        result.query_results.find_or_create_by(query_id: query_id)
      rescue StandardError => e
        puts e.message
      end
    end 
  end
end