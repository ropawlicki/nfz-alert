class AppointmentUpdateWorker
  include Sidekiq::Worker

  def perform
    b = Sidekiq::Batch.new
    b.jobs do
      offset = 0
      Query.find_each do |query|
        page_count = PageCount.call(query.id)
        (1..page_count).each { |page| AppointmentFetchWorker.perform_in(offset, query.id, page); offset += 0.2 }
      end
    end
  end
end