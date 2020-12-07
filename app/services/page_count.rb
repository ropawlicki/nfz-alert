# frozen_string_literal: true

class PageCount
  def self.call(query_id)
    response = ResponseRetriever.call(query_id, 1)
    CGI.parse(response.fetch('links').fetch('last'))['/app-itl-api/queues?page'][0].to_i
  end
end
