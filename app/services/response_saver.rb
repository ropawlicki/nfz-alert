class ResponseSaver

  def self.call(response, query_id)

    response["data"].each do |response|
      begin
        response = ResponseParser.call(response)
        result = Result.find_by(benefit: response["benefit"], provider: response["provider"], place: response["place"],
          address: response["address"])
        if result.nil?
          result = Result.create(response)
        else
          result.update_attribute(:validated_at, Time.zone.now)
        end
        result.update_attribute(:mailing_ready_at, Time.zone.now) if result.mailing_ready_at.nil?
        result.query_results.find_or_create_by(query_id: query_id)
      rescue StandardError => e
        e.message
      end
    end 
  end
end