# frozen_string_literal: true

class InitialSearch
  def self.call(query_id)
    page_count = PageCount.call(query_id)
    (1..page_count).each { |page| InitialFetch.call(query_id, page) }
  end
end
