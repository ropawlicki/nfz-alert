class AppointmentUpdateBatch
  include Sidekiq::Worker

  def perform
    b = Sidekiq::Batch.new
    b.on(:complete, AppointmentUpdateBatch)
    b.jobs { AppointmentUpdateWorker.perform_async }
  end

  def on_complete(status, options)
    ResultCleanerWorker.perform_async
  end
end