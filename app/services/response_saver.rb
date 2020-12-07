# frozen_string_literal: true

class ResponseSaver
  def self.call(response, query_id)
    response['data'].each do |response|
      response = ResponseParser.call(response)
      next if response['date'] < DateTime.now

      result =
        Result
        .find_by(
          benefit: response.fetch('benefit').squish,
          provider: response.fetch('provider').squish,
          place: response.fetch('place').squish,
          address: response.fetch('address').squish
        )
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
