class ResponseParser

  def self.call(response)
    valid_keys = ["benefit", "provider", "place", "address", "phone", "toilet", "ramp", "car-park", "elevator",
      "locality"]
    response["attributes"].slice(*valid_keys).merge(response["attributes"]["dates"].slice("date"))
  end

end