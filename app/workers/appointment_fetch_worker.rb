class AppointmentFetchWorker
  include Sidekiq::Worker

  def perform(query_id, next_link=false)
    response = ResponseRetriever.call(query_id, next_link)

    valid_keys = ["benefit", "provider", "place", "address", "phone", "toilet", "ramp", "car-park", "elevator"]

    response["data"].each do |response|
      response = response["attributes"].slice(*valid_keys)
      result = Result.find_by(benefit: response["benefit"], provider: response["provider"], place: response["place"],
        address: response["address"])
      if result.nil?
        result = Result.create(response)
      else
        result.update_attribute(:active, true)
      end
      result.query_results.find_or_create_by(query_id: query_id)
    end

    if response["links"]["next"]
      AppointmentFetchWorker.perform_in((0.2).seconds, query_id, response["links"]["next"])
    end
  end

end