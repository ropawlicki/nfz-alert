class PageCount

  def self.call(query_id)
    response = ResponseRetriever.call(query_id, 1)
    page_count = CGI::parse(response["links"]["last"])["/app-itl-api/queues?page"][0].to_i
  end

end