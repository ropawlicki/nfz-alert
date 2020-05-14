class ResponseRetriever

  def self.call(id, page)
    query = Query.find(id)
    query_params = query.serializable_hash(except: [:id, :created_at, :updated_at])

    default_params = { format: "json", limit: 25, page: page }
    params = query_params.merge(default_params)

    HTTParty.get("https://api.nfz.gov.pl/app-itl-api/queues", query: params)
  end

end