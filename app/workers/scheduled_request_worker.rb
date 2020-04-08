class ScheduledRequestWorker
  include Sidekiq::Worker

  def perform
    b = Sidekiq::Batch.new
    b.on(:success, ScheduledRequestWorker)
    b.jobs do
      ActiveResetWorker.perform_async
    end
  end

  def on_success(status, options)
    AppointmentUpdateWorker.perform_async
  end
end