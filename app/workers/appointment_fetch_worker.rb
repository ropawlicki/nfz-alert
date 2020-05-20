class AppointmentFetchWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(query_id, page, retries=1)
    b = Sidekiq::Batch.new
    b.jobs do
      begin
        response = ResponseRetriever.call(query_id, page)
        ResponseSaver.call(response, query_id)
      rescue StandardError => e
        puts e.message
        puts "ATTEMPTING #{retries} RETRY" 
        if retries < 2
          AppointmentFetchWorker.perform_in(5, query_id, page, retries+1)
        else
          puts("GAVE UP AFTER #{retries} RETRIES")
          raise StandardError
        end
      end
    end 
  end

end