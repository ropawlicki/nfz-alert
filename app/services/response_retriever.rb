class ResponseRetriever

  def self.call(id, next_link)
    if next_link == false

      query = Query.find(id)
      query_params = query.serializable_hash(except: [:id, :created_at, :updated_at])

      default_params = { format: "json", limit: 25 } # czy nie lepiej gdzieś to wyrzucić (service)?
      params = query_params.merge(default_params)

      response = HTTParty.get("https://api.nfz.gov.pl/app-itl-api/queues", query: params)

    else
      response = HTTParty.get("https://api.nfz.gov.pl#{next_link}")
    end
  end

end