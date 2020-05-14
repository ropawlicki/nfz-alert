class ResultFetch

  def self.call(query_id)
    page_count = PageCount.call(query_id)

    (1..page_count).each do |page|
      AppointmentFetchWorker.perform_in(page*0.2, query_id, page)
    end

  end

end