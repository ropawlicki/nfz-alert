class ResponseParser

  VALID_KEYS = ["benefit", "provider", "place", "address", "phone", "toilet", "ramp", "car-park", "elevator", "locality"].freeze

  def self.call(response)
    attributes = response.fetch("attributes")
    attributes.slice(*VALID_KEYS).merge(attributes.fetch("dates").slice("date"))
  end

end